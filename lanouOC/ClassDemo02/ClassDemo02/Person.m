//
//  Person.m
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name,identify,sex,age;

+(id)personWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age
{
    Person *person = [[Person alloc] initWithName:_name identify:_identify sex:_sex age:_age];
    return [person autorelease];
}

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age
{
    if (self = [super init]) {
        
        name = _name;
        identify = _identify;
        sex = _sex;
        age = _age;
    }
    return self;
}


@end
