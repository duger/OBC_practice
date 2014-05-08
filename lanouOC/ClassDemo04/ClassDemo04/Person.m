//
//  Person.m
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void) setCar:(Car *) car
{
    _car = [car retain];        //谁retain
}

-(Car *)car
{
    return _car;
}

- (void)dealloc
{
    [_car release];             //谁release
    [super dealloc];
}

@end
