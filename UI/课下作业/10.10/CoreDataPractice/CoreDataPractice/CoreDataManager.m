//
//  CoreDataManager.m
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CoreDataManager.h"
#import "Person.h"

@interface CoreDataManager ()
-(NSManagedObjectContext *)context;
-(NSPersistentStoreCoordinator *)coordinator;
-(NSManagedObjectModel *)model;


@end

@implementation CoreDataManager
{
    NSManagedObjectContext *context;
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
}
static CoreDataManager *s_CoreDataManager = nil;
+(CoreDataManager *)defaultManager
{
    @synchronized(self)
    {
        if (s_CoreDataManager == nil) {
            s_CoreDataManager = [[self alloc]init];
            
        }
    }
    return s_CoreDataManager;
    
}

- (id)init
{
    self = [super init];
    if (self) {
        [self context];
        //注册一个观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:NSManagedObjectContextObjectsDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - 管理器 连接器 模型
-(NSManagedObjectContext *)context
{
    if (context != nil) {
        return context;
    }
    context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    [context setPersistentStoreCoordinator:self.coordinator];
    return context;
}

-(NSPersistentStoreCoordinator *)coordinator
{
    if (coordinator != nil) {
        return coordinator;
    }
    coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self model]];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/custom.sqlite"];
    NSURL *url = [NSURL fileURLWithPath:sqlitePath];
    NSError *error = nil;
    
    NSMutableDictionary *options = [[NSMutableDictionary alloc]init];
    [options setObject:@(YES) forKey:NSMigratePersistentStoresAutomaticallyOption];
    [options setObject:@{@"journal_mode":@"DELETE"} forKey:NSSQLitePragmasOption];
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error];
    
    [options release];
    
    if (error != nil) {
        NSLog(@"%@",error);
        return nil;
    }
    
    return coordinator;
}

-(NSManagedObjectModel *)model
{
    if (model != nil) {
        return model;
    }
    model = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    return model;
}

#pragma mark - public pethods

-(void)save
{
    if ([[self context] hasChanges]) {
        [[self context] save:nil];
    }
}

-(Person *)createdPerson
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self context]];
    Person *person = [[Person alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    //    [self save];
    return [person autorelease];
}

-(void)deletePerson:(Person *)person
{
    [[self context] deleteObject:person];
    //    [self save];
}

-(Person *)lastPerson
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSArray *result = [[self context]executeFetchRequest:fetchRequest error:nil];
    return [result lastObject];
}
-(NSArray *)allTeacher
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Teacher"];
    NSArray *result = [[self context]executeFetchRequest:fetchRequest error:nil];
    return result;
}

//-(NSArray *)allStudent:(Teacher *)teacher
//{
//
//}

-(Teacher *)createdTeacher
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Teacher" inManagedObjectContext:[self context]];
    Teacher *teacher = [[Teacher alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    //    [self save];
    return [teacher autorelease];
}
-(Student *)createdStudent
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    Student *student = [[Student alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    return [student autorelease];
}

-(NSArray *)sortStudent
{
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    [fetchRequest setSortDescriptors:sortDescriptors];
    sortDescriptors = [[self context]executeFetchRequest:fetchRequest error:nil];
    
    [sortDescriptor release];
    
    return [sortDescriptors autorelease];
}

-(void)deleteTeacher:(Teacher *)teacher
{
    [[self context] deleteObject:teacher];
    
}
-(void)deleteStudent:(Student *)student
{
    [[self context]deleteObject:student];
}
@end
