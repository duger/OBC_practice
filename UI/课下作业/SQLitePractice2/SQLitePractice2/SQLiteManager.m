//
//  SQLiteManager.m
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SQLiteManager.h"
#import "Person.h"
#import <sqlite3.h>

static inline NSString *toNSString(const unsigned char *Str)
{
    return [NSString stringWithUTF8String:Str];
}

@interface SQLiteManager()

-(void)_open;

-(void)_close;

@end

@implementation SQLiteManager
{
    sqlite3 *dataBase;
}
static SQLiteManager *s_SQLiteManager = nil;
+(SQLiteManager *)defaultManager
{
    @synchronized(self)
    {
        if (s_SQLiteManager == nil) {
            s_SQLiteManager = [[self alloc]init];
        }
    }
    return s_SQLiteManager;
}

-(void)_open
{
#define cSQLiteName  @"myBase.sqlite"
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/%@",cSQLiteName];
    sqlite3_open([sqlitePath UTF8String], &dataBase);
}

-(void)_close
{
    sqlite3_close(dataBase);
}


-(int)createTable:(NSString *)tableName attribute:(NSDictionary *)attribute
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"create table %@(",tableName];
    NSArray *allkey = [attribute allKeys];
    for (NSString *key in allkey) {
        [sql appendFormat:@"%@ %@,",key,[attribute objectForKey:key]];
    }
    [sql deleteCharactersInRange:NSMakeRange([sql length] - 1 , 1)];
    [sql appendString:@")"];
    NSLog(@"打印前 %@",sql);
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

-(NSMutableArray *)tableListFromDataBase
{
    [self _open];
    NSString *sql = @"select * from sqlite_master";
    NSMutableArray *tableListArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement = NULL;
    sqlite3_prepare(dataBase, [sql UTF8String], [sql length], &statement, NULL);
    while (sqlite3_step(statement) == SQLITE_ROW) {
        NSString *tableName = toNSString(sqlite3_column_text(statement, 2));
        [tableListArray addObject:tableName];
        NSLog(@"钱钱%@",tableName);
    }
    sqlite3_finalize(statement);
    [self _close];
    NSLog(@"产生%@",tableListArray);
    return [tableListArray autorelease];
}

-(int)dropTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"drop table %@",tableName];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

-(NSArray *)itemListFromTalbe:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    [self _open];
    sqlite3_stmt *stament = NULL;
    sqlite3_prepare(dataBase, [sql UTF8String], [sql length], &stament, NULL);
    NSMutableArray *itemList = [[NSMutableArray alloc]init];
    while (sqlite3_step(stament) == SQLITE_ROW) {
        Person *person = [[Person alloc]init];
        person.pID = toNSString(sqlite3_column_text(stament, 0));
        person.pName = toNSString(sqlite3_column_text(stament, 1));
        person.pAge = toNSString(sqlite3_column_text(stament, 2));
        [itemList addObject:person];
        [person release];
    }
    return [itemList autorelease];
    
}

-(Person *)findItem:(NSString *)text
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM Person WHERE pID =  '%@'",text];
    [self _open];
    sqlite3_stmt *stament = NULL;
    sqlite3_prepare(dataBase, [sql UTF8String], [sql length], &stament, NULL);
    Person *person = [[Person alloc]init];
    while (sqlite3_step(stament) == SQLITE_ROW) {
        
        person.pID = toNSString(sqlite3_column_text(stament, 0));
        person.pName = toNSString(sqlite3_column_text(stament, 1));
        person.pAge = toNSString(sqlite3_column_text(stament, 2));
        
    }
    return [person autorelease];
    
}

-(int)insertItem:(Person *)person andTableName:(NSString *)tableName
{
    NSString *sql = [person insertSQL:tableName];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

-(int)removeItem:(Person *)person
{
    NSString *sql = [person removeFromSQL];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

-(int)updateItem:(Person *)person
{
    NSString *sql = [person updateSQL];
    [self _open];
    int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}


@end
