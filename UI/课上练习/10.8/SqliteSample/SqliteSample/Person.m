//
//  Person.m
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)insertSQL
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendString:@"insert into Person(pid,pname,page) values("];
    [sql appendFormat:@"'%@','%@','%@'",self.pid,self.pname,self.page];
    [sql appendString:@")"];
    return sql;
}

-(NSString *)removeSQL:(int)index
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"delete from Person where pid = %d",index];
    NSLog(@"wancheng前的语句：%@",sql);
    return sql;
}

-(NSString *)updateSQL:(Person *)person
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"update Person set pname = '%@' where pid = %@",person.pname,person.pid];
    return sql;
}

@end
