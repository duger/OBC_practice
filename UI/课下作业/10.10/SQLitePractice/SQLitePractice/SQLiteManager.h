//
//  SQLiteManager.h
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface SQLiteManager : NSObject
+(SQLiteManager *)defaultManager;

//创建表格
-(int) createTable:(NSString *)tableName attribute:(NSDictionary *)attribute;
//查表
-(NSMutableArray *)tableListFromDatabase;
//删除表格
-(int)dropTable:(NSString *)tableName;
//查询某表中数据
-(NSArray *)itemListFromTable:(NSString *)tableName;

//插入数据
-(int)insertItem:(Person *)person;
//删除数据
-(int)removeItem:(Person *)person;
//更新数据
-(int)updateItem:(Person *)person;
@end
