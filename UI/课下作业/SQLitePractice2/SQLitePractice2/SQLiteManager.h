//
//  SQLiteManager.h
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface SQLiteManager : NSObject
+(SQLiteManager *)defaultManager;

-(int)createTable:(NSString *)tableName attribute:(NSDictionary *)attribute;

-(NSMutableArray *)tableListFromDataBase;

-(int)dropTable:(NSString *)tableName;

-(NSArray *)itemListFromTalbe:(NSString *)tableName;

-(int)insertItem:(Person *)person andTableName:(NSString *)tableName;

-(int)removeItem:(Person *)person;

-(int)updateItem:(Person *)person;

-(Person *)findItem:(NSString *)text;

@end
