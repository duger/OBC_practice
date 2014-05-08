//
//  Car.m
//  Car
//
//  Created by Duger on 13-8-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize cID,speed,name;
-(id) init
{
    if (self = [super init]) {
//        cID = 2313;
//        speed = 1200;
//        name = @"小汽车";
    }
    return self;
}
-(id) initWithName: (NSString *) _name carSpeed: (float) _speed carID: (int) _cID
{
    if (self = [super init]) {
        cID = _cID;
        speed = _speed;
        name = _name;
    }
    return self;
}

-(void) run{
    NSLog(@"START");
    NSLog(@"The car's name is:%@ speed:%.2f",name,speed);
    }
@end
