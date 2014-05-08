//
//  Student.m
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize name = _name,number = _number,score = _score,sex = _sex;

-(id)initWithName:(NSString *)name number:(NSString *)number sex:(NSString *)sex score:(CGFloat)score
{
    if (self = [super init]) {
        _name = name;
        _number = number;
        _sex = sex;
        _score = score;
    }
    return self;
}

+(id)studentWithName:(NSString *)name number:(NSString *)number sex:(NSString *)sex score:(CGFloat)score
{
    Student *student = [[Student alloc]initWithName:name number:number sex:sex score:score];
    return [student autorelease];
    
}

+(id)studentWithName:(NSString *)name
{
    Student *student = [[Student alloc]initWithName:name number:nil sex:nil score:0];
    return [student autorelease];
}
@end
