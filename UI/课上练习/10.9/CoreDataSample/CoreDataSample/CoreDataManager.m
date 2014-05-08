//
//  CoreDataManager.m
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CoreDataManager.h"


@interface CoreDataManager ()
-(NSManagedObjectContext *)context;
-(NSPersistentStoreCoordinator *)coordinator;
-(NSManagedObjectModel *)model;


@end

@implementation CoreDataManager
{
    //数据管理器
    NSManagedObjectContext *context;
    //数据连接器
    NSPersistentStoreCoordinator *coordinator;
    //数据模型器
    NSManagedObjectModel *model;
}

static CoreDataManager *s_CoreDataManager = nil;
+(CoreDataManager *)intence
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_CoreDataManager == nil) {
            s_CoreDataManager = [[CoreDataManager alloc]init];
        }
    });
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

#pragma mark - 管理器 - 连接器 - 模型器
-(NSManagedObjectContext *)context
{
    if (context != nil) {
        
        return context;
     }
    context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    //设置连接器
        [context setPersistentStoreCoordinator:[self coordinator]];
    
    return context;
}
-(NSPersistentStoreCoordinator *)coordinator
{
    if (coordinator != nil) {
        return coordinator;
    }
    
    coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self model]];
    //增加数据连接器的存柱作用
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //设置数据库保存路径
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/custom.sqlite"];
    //设置url
    NSURL *url = [NSURL fileURLWithPath:sqlitePath];
    //设置
    NSError *error = nil;
    
    
    //添加连接器升级时，使用的设置
    NSMutableDictionary *options = [[NSMutableDictionary alloc]init];
    [options setObject:@(YES) forKey:NSMigratePersistentStoresAutomaticallyOption];
    
    //NSSQLiteStoreType 保存为数据库类型
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error];
    
    [options release];
    //如果有错误使次连接器失效
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

#pragma mark - public methods
-(Person *)createdPerson
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self context]];
    
    Person *person = [[Person alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    
    [self save];
    
    return  [person autorelease];
}

-(void)save
{
    if ([[self context] hasChanges]) {
        [[self context] save:nil];
    }
}

-(void)deletePerson:(Person *)person
{
    [[self context] deleteObject:person];
    [self save];
}

//获取最后的person
-(Person *)lastPerson
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSArray *result = [[self context]executeFetchRequest:fetchRequest error:nil];
    return [result lastObject];
}


-(Teacher *)createdTeacher
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Teacher" inManagedObjectContext:[self context]];
    
    Teacher *teacher = [[Teacher alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    
    [self save];
    
    return  [teacher autorelease];
    
}
-(Student *)createdStudent
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    
    Student *student = [[Student alloc]initWithEntity:entity insertIntoManagedObjectContext:[self context]];
    
    [self save];

    return  [student autorelease];
}

-(void)deleteObject:(NSManagedObject *)object
{
    [[self context] deleteObject:object];
    [self save];
}

-(NSArray *)allTeacher
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Teacher"];
    NSArray *result = [[self context]executeFetchRequest:fetchRequest error:nil];
    return result;
}

-(void)deleteStudent:(Student *)student
{
    [[self context] deleteObject:student];
    [self save];
}

-(void)deleteTeacher:(Teacher *)teacher
{
    [[self context] deleteObject:teacher];
    [self save];
}

@end
