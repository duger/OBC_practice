//
//  ClassB.m
//  ClassAB
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

-(void) initVar
{
    [super initVar];
    x = 300;
}

-(void) printVar{
    NSLog(@"B:%d",x);
}

@end
