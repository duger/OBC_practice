//
//  Student.m
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Student.h"

@implementation Student


-(id)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex address:(NSString *)address hobby:(NSString *)hobby
{
    if (self = [super init]) {
        _name = name;
        _age = age;
        _sex = sex;
        _address = address;
        _hobby = hobby;
    }
    return self;
}

-(void)sayHi
{
    NSLog(@"Hi!我是%@ %ld ",_name,_age);
}

- (void)dealloc
{
    [_name release];
    [_sex release];
    [_address release];
    [_hobby release];    
    [super dealloc];
}
@end
