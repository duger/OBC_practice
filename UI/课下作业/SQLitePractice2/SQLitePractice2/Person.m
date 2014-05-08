//
//  Person.m
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)insertSQL:(NSString *)tableName
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"insert into %@(pID,pName,pAge) ",tableName];
    [sql appendFormat:@"values(%@,'%@','%@')",self.pID,self.pName,self.pAge];
    return sql;
}

-(NSString *)removeFromSQL
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"delete from Person where pID = %@",self.pID];
    return sql;
}
-(NSString *)updateSQL
{
    NSMutableString *sql = [NSMutableString string];
    [sql appendFormat:@"update Person set pName = '%@' where pID = %@ ; update Person set pAge = '%@' where pID = %@",self.pName,self.pID,self.pAge,self.pID];
    return sql;
}




@end
