//
//  Person.h
//  Person
//
//  Created by Duger on 13-7-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    //实例变量声明
    int identify;
    int age;
}
    //方法声明
-(id) initWithAge:(int)_age identify:(int) _identify;

//-(int) getIdentify;
//-(int) getage;
//-(void) setAge:(int) _age;
@property(nonatomic) int identify;
@property(nonatomic) int age;
@end