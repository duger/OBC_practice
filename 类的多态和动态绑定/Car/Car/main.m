//
//  main.m
//  Car
//
//  Created by Duger on 13-8-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Bmw.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Car *car = [[Car alloc] init];
        
       
//        car ->cID = 33;
        Car *bmw = [[Bmw alloc] initWithName:@"迷你" carSpeed:323 carID:10003];
        
        [bmw run];
        [car run];
        
        bmw.name = @"coper";
        NSLog(@"%@ ",bmw.name);
        
        //处理动态方法调用 NSObject 的方法
        
        //判断宝马是不是Car类或它的成员
            if ([bmw isKindOfClass:[Car class]]) {
            NSLog(@"BMW is a kind of Car");
        }
        
        if ([bmw isMemberOfClass:[Car class]]) {
            NSLog(@"BMW is a member of Car");
        }
        
        if ([car isMemberOfClass:[Car class]]) {
            NSLog(@"car is a member of Car");
        }
        //对象是否响应@selector指定的方法
        if ([car respondsToSelector:@selector(run)]) {
            NSLog(@"car respinds to run method");
            
        }
        
//        SEL action;
//        action = @selector(run);
//        [car performSelector:action];
//
//        [car performSelector:@selector(run)];

//        @try {
//            [car file];
//        }
//        @catch (NSException *exception) {
////            [exception name],[exception reason];
//            NSLog(@"catch exception %@ %@",[exception name],[exception reason]);
//        }
//        @finally {
//            ;
//        }
    }
    return 0;
}

