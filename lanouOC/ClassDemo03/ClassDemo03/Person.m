//
//  Person.m
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name;

-(void) setAge:(NSInteger) _age
{
    if (_age < 18) {
        age = _age;
    }
    
}

@end
