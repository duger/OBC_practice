//
//  Car.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize number,name,weight;

-(id)init
{
    self = [super init];
    if (self) {
        number = 01;
        name = @"baoma";
        weight = 780.45;
    }
    return self;
}

+(id) carWithNumber:(NSInteger) _number name:(NSString *)_name weight:(float) _weight
{
    Car *car = [[Car alloc] initWithNumber:_number andName:_name andWeight:_weight];
    return [car autorelease];
}

-(id) initWithNumber:(NSInteger )_number andName:(NSString *)_name andWeight:(float )_weight
{
    self = [super init];
    if (self) {
        number = _number;
        name = _name;
        weight = _weight;
       
    }
    return self;
}

-(id) initWithNumber:(NSInteger )_number
{
    if (self = [super init]) {
        number = _number;
        name = nil;
        weight = 0;
    }
    return self;
}

+(id) carWithName:(NSString *)_name
{
    Car *car = [[Car alloc]initWithNumber:0 andName:_name andWeight:0];
    return [car autorelease];
}

-(void) introduceYourself{
    NSLog(@"我是：%@ ，编号：%ld , 重量：%f ",name,number,weight);
}

-(void) drive
{
    NSLog(@"Engeenings START!!");
}

- (void)dealloc
{
    [name release];
    [super dealloc];
}

@end
