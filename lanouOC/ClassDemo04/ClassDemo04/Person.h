//
//  Person.h
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Person : NSObject
{
    Car *_car;
}
-(Car *)car;
-(void) setCar:(Car *) car;
@end
