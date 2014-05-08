//
//  Person.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) sayHi
{
    NSLog(@"To be or not to be,that is a question!");
}

-(void) eat
{
    NSLog(@"Let's eat some ting!");
}


-(void) setName
{
    _name = @"Duger";
}
-(void) getName
{
    NSLog(@"%@",_name);
    
}

@end
