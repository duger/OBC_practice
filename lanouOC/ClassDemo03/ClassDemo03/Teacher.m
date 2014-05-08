//
//  Teacher.m
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
@synthesize name,sex,school; 

-(id)initWithName:(NSString *)_name sex:(NSString *)_sex school:(NSString *)_school
{
    if (self = [super init]) {
        name = _name;
        sex = _sex;
        school = _school;
    }
    return self;
}
+(id)teacherWithName:(NSString *)_name sex:(NSString *)_sex school:(NSString *)_school
{
    Teacher *teacher = [[Teacher alloc]initWithName:_name sex:_sex school:_school];
    return [teacher autorelease];
}

        


@end
