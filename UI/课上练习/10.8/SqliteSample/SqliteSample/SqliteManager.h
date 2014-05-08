//
//  SqliteManager.h
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
//用来管理数据库数据


@interface SqliteManager : NSObject
+(SqliteManager *)singleton;
//测试
-(void)test;
//创建数据表格
-(int) createTable:(NSString *)tableName attribute:(NSDictionary *)attribute;
//插入数据
-(int)insert:(NSObject *)object;
//删除数据
-(int)remove:(NSObject *)object andIndex:(int)index;
//更新数据
-(int)update:(Person *)object;
//删除表格
-(int)dropTable:(NSString *)tableName;
//查询数据
-(NSArray *)itemListFromTable:(NSString *)tableName;
//查询表格
-(NSMutableArray *)tableListFromData;


@end
