//
//  Person.m
//  PersonGetSet
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"
#import "Student.h"
static int gCount = 10;

@implementation Person

@synthesize myNumber;

- (id)init
{
    self = [super init];
    if (self) {
       int s = [[Student alloc]init];
    }
    return self;
}

//普通get和set方法
//-(int) myNumber{
//    return myNumber;
//}
//-(void) setMyNumber:(int) _number{
//    myNumber = _number;
//}
-(void) printInfo{
    NSLog(@"Person number is : %d",myNumber);
}
@end
