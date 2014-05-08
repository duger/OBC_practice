//
//  Person.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety
{
    if (self = [super init]) {
        _name = name;
        _sex = sex;
        _age = age;
        _identety = identety;
    }
    return self;
}

+(id)personWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety
{
    Person *person = [[self alloc]initWithName:name sex:sex age:age identety:identety];
    return [person autorelease];
}


- (void)dealloc
{
    
    [_name release];
    [_sex release];
    [_identety release];
    
    NSLog(@"person died");
    [super dealloc];
}
@end
