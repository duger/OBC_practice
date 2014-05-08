//
//  CoreDataManager.m
//  ToDoListManger
//
//  Created by Duger on 13-10-12.
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
    NSManagedObjectContext *context;
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
}

static CoreDataManager *s_CoreDataManager = nil;
+(CoreDataManager *)defaultManager
{
    @synchronized(self)
    {
        if(s_CoreDataManager == nil) {
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
    [context setPersistentStoreCoordinator:[self coordinator]];
    return context;
}
-(NSPersistentStoreCoordinator *)coordinator
{
    if (coordinator != nil) {
        return coordinator;
    }
    coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self model]];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/custom.sqlite"];
    NSURL *url = [NSURL fileURLWithPath:sqlitePath];
    NSError *error = nil;
    
    NSMutableDictionary *options = [[NSMutableDictionary alloc]init];
    [options setObject:@(YES) forKey:NSMigratePersistentStoresAutomaticallyOption];
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error];
    [options release];
    
    if (error != nil) {
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
//反序列化
-(UIColor *)unarchiveUIColor:(NSData *)colorData
{
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    return color;
}
//序列化颜色
-(NSData *)archiveUIColor:(UIColor *)color
{
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    return colorData;
    
}


@end
