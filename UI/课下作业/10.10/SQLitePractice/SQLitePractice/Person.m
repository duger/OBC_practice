//
//  Person.m
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)insertSQL
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendString:@"insert into Person(pId,pName,pAge) values("];
    [sql appendFormat:@"'%@','%@','%@'",self.pId,self.pName,self.pAge];
    [sql appendString:@")"];
    return sql;
}

-(NSString *)removeSQL:(Person *)person
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"delete from Person where pId = %@",self.pId];
    return sql;
}

-(NSString *)updateSQL:(Person *)person
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"update Person set pName = '%@' where pId = %@",person.pName,person.pId];
    [sql appendString:@"; "];
    [sql appendFormat:@"update Person set pAge = '%@' where pId = %@",person.pAge,person.pId];
    return sql;
}

@end
