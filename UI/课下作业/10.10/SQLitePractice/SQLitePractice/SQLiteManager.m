//
//  SQLiteManager.m
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SQLiteManager.h"
#import <sqlite3.h>
#import "Person.h"

static inline NSString *toNSString(const unsigned char *pStr)
{
    return [NSString stringWithUTF8String:pStr];
}

@interface SQLiteManager ()
//打开数据库
-(void)_open;
//关闭
-(void)_close;


@end


@implementation SQLiteManager
{
    sqlite3 *dataBase;
}

//打开数据库
-(void)_open
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
#define kSQLiteName @"practice.sqlite"
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/%@",kSQLiteName];
    sqlite3_open([sqlitePath UTF8String], &dataBase);
}
//关闭
-(void)_close
{
    sqlite3_close(dataBase);
}

static SQLiteManager *s_SQLiteManager = nil;
+(SQLiteManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_SQLiteManager == nil) {
            s_SQLiteManager = [[SQLiteManager alloc]init];
        }
    });
    return s_SQLiteManager;
    
  
}

//创建表格
-(int) createTable:(NSString *)tableName attribute:(NSDictionary *)attribute
{
    NSMutableString *sql = [[NSMutableString alloc]init];
    [sql appendString:@"create table "];
    [sql appendString:tableName];
    [sql appendString:@"("];
    
    NSArray *allKey = [attribute allKeys];
    for (NSString *key in allKey) {
        NSString *value = [attribute objectForKey:key];
        [sql appendFormat:@"%@ %@,",key,value];
    }
    [sql deleteCharactersInRange:NSMakeRange([sql length] - 1, 1)];
    [sql appendString:@")"];
    NSLog(@"创建表格时 %@",sql);
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    [sql release];
    return result;
}

-(NSMutableArray *)tableListFromDatabase
{
    [self _open];
    NSString *sql = @"select * from sqlite_master";
    NSMutableArray *tableListArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement = NULL;
    sqlite3_prepare(dataBase, [sql UTF8String], [sql length], &statement, NULL);
    while (sqlite3_step(statement) == SQLITE_ROW) {
        NSString *tableName = toNSString(sqlite3_column_text(statement, 2));
        [tableListArray addObject:tableName];
    }
    sqlite3_finalize(statement);
    [self _close];
    return  [tableListArray autorelease];
    
    
}

//删除表格
-(int)dropTable:(NSString *)tableName
{
    [self _open];
    NSMutableString *sql = [[NSMutableString alloc]init];
    [sql appendFormat:@"drop table %@",tableName];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    
    [self _close];
    [sql release];
    return result;
}

//查询某表中数据
-(NSArray *)itemListFromTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    [self _open];
    sqlite3_stmt *stament = NULL;
    sqlite3_prepare(dataBase, [sql UTF8String], [sql length], &stament, NULL);
    NSMutableArray *resultList = [[NSMutableArray alloc]init];
    while (sqlite3_step(stament) == SQLITE_ROW) {
        Person *person = [[Person alloc]init];
        person.pId =toNSString(sqlite3_column_text(stament, 0));
        person.pName = toNSString(sqlite3_column_text(stament, 1));
        person.pAge = toNSString(sqlite3_column_text(stament, 2));
        [resultList addObject:person];
        [person release];
        
    }
    return [resultList autorelease];
}

//插入数据
-(int)insertItem:(Person *)person
{
    NSString *sql = [person insertSQL];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

//删除数据
-(int)removeItem:(Person *)person
{
    NSString *sql = [person removeSQL:person];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

-(int)updateItem:(Person *)person
{
    NSString *sql = [person updateSQL:person];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

@end
