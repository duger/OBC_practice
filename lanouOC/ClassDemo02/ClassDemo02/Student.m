//
//  Student.m
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Student.h"


@implementation Student
@synthesize school,record;

+(id)studentWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger)_age School: (NSString *)_school record:(NSString *)_record
{
    Student *student = [[Student alloc]initWithName:_name identify:_identify sex:_sex age:_age School:_school record:_record];
    return [student autorelease];
}

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger)_age School: (NSString *)_school record:(NSString *)_record;
{
    
    if (self = [super initWithName:_name identify:_identify sex:_sex age:_age]) {
//        name = _name;
//        identify = _identify;
//        sex = _sex;
//        age = _age;
        school = _school;
        record = _record;
    }
    
    return self;
}


@end
