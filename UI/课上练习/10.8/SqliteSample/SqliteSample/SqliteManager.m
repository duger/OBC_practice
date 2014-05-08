//
//  SqliteManager.m
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SqliteManager.h"
#import <sqlite3.h>
#import "Person.h"

static inline NSString *toto(const unsigned char *pStr)
{
    return [NSString stringWithUTF8String:pStr];
}

@interface SqliteManager ()
//打开数据库
-(void)_open;
//关闭数据库
-(void)_close;
@end

@implementation SqliteManager
{
    sqlite3 *database;
}
//打开数据库
-(void)_open
{
    //获取Document文件夹路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSLog(@"%@",documentPath);
    
    
    
    
#define kSqliteName @"custom.sqlite"
    //获取数据库文件对应路径
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/%@",kSqliteName];
    NSLog(@"%@",sqlitePath);
    
    //使用函数打开数据库，并且将数据库对象赋值给database
    sqlite3_open([sqlitePath UTF8String], &database);

}
//关闭数据库
-(void)_close
{
    sqlite3_close(database);
}


static SqliteManager *s_SqliteManager = nil;
+(SqliteManager *)singleton
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_SqliteManager == nil) {
            s_SqliteManager = [[SqliteManager alloc]init];
        }
    });
    return s_SqliteManager;
}

//测试方法
-(void)test
{
    //获取Document文件夹路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSLog(@"%@",documentPath);
    



#define kSqliteName @"custom.sqlite"
//获取数据库文件对应路径
    NSString *sqlitePath = [documentPath stringByAppendingFormat:@"/%@",kSqliteName];
    NSLog(@"%@",sqlitePath);
    
    //声明一个变量，指向数据库对象
//    sqlite3 *database = NULL;
    
    //使用函数打开数据库，并且将数据库对象赋值给database
    sqlite3_open([sqlitePath UTF8String], &database);
    
    //通过执行sql语句，创建数据库的表
    NSString *sql = @"create table student(sid integer,sname text,sage text)";
    //执行函数
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    
    //通过执行sql语句，插入数据
    sql = @"insert into student(sid,sname,sage) values(1,'wangfu','24')";
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    
    //更新数据
    sql = @"update person set student = 'jure' where sid = 1";
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    
    //删除数据
    sql = @"delete from student where sid = 1";
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    
    //删除表格
    sql = @"drop table student";
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);

    
    }

//创建数据表格
-(int) createTable:(NSString *)tableName attribute:(NSDictionary *)attribute;
{
    [self _open];
    //实例化sql语句
    NSMutableString *sql = [[NSMutableString alloc]init];
    //构造sql语句
    [sql appendString:@"create table "];
    [sql appendString:tableName];
    [sql appendString:@"("];
    
    NSArray *allKey = [attribute allKeys];
    for (NSString *item in allKey) {
        NSString *value = [attribute objectForKey:item];
        [sql appendFormat:@"%@ %@,",item,value];
    }
    [sql deleteCharactersInRange:NSMakeRange([sql length] - 1, 1)];
    [sql appendString:@")"];
    
    //执行sql语句
    NSLog(@"创建表格前的sql语句%@",sql);
    int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);

    [self _close];
    return result;
}

//删除表格
-(int)dropTable:(NSString *)tableName
{
    [self _open];
    NSMutableString *sql = [[NSMutableString alloc]init];
    [sql appendFormat:@"drop table %@",tableName];
    NSLog(@"删除表格前%@",sql);
    int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;

}


//插入数据
-(int)insert:(NSObject<SqlProtocol> *)object
{
    //获取对应的插入语句
    NSString *sql = [object insertSQL];
    //打开数据库
    [self _open];
    //执行
    int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
    
}
//删除数据
-(int)remove:(NSObject<SqlProtocol> *)object andIndex:(int)index
{
    NSString *sql = [object removeSQL:index];
    NSLog(@"index,%d删除前的语句：%@",index,sql);
    [self _open];
    int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
    
    
}
//更新数据
-(int)update:(Person<SqlProtocol> *)object
{
    NSString *sql = [object updateSQL:object];
    NSLog(@"index,更新前前的语句：%@",sql);
    [self _open];
    int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
    [self _close];
    return result;
}

//查询数据
-(NSArray *)itemListFromTable:(NSString *)tableName
{
    [self _open];
    //设置sql语句
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    
    //声明sql执行状态对象
    sqlite3_stmt *statement = NULL;
    //获取执行状态对象
    sqlite3_prepare(database, [sql UTF8String], [sql length], &statement, NULL);
    //执行sql语句
    NSMutableArray *resultList = [[NSMutableArray alloc]init];
    while (sqlite3_step(statement) == SQLITE_ROW) {
        Person *person = [[Person alloc]init];
        person.pid = toto( sqlite3_column_text(statement, 0));
        person.pname = toto( sqlite3_column_text(statement, 1));
        person.page = toto (sqlite3_column_text(statement, 2));
        
        [resultList addObject:person];
  #pragma mark      [person release];
    }
    
    
    //终止执行状态对象
    sqlite3_finalize(statement);
    
    [self _close];
    return resultList;
}

-(NSMutableArray *)tableListFromData
{
    [self _open];
    //设置sql语句
    NSString *sql = @"select * from sqlite_master";
    NSMutableArray *tableListArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement = NULL;
    sqlite3_prepare(database, [sql UTF8String], [sql length], &statement, NULL);
    while (sqlite3_step(statement) == SQLITE_ROW) {
        NSString *tabelName = [[NSString alloc]init];
        tabelName = toto(sqlite3_column_text(statement, 2));
        [tableListArray addObject:tabelName];
//        [tabelName release];
    }
    sqlite3_finalize(statement);
    [self _close];
    NSLog(@"表的名%@",tableListArray);
    return tableListArray;
    //要不要写个autorelease
}

@end
