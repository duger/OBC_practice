//
//  MyClass.m
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass


-(void) setStu:(Student *)stu
{
    if (_stu != stu) {
        [_stu release];
        _stu = [stu retain];
    }
    
}

- (void)dealloc
{
    [_stu release];
    [super dealloc];
}
@end
