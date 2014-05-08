//
//  main.m
//  Person
//
//  Created by Duger on 13-7-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //对象创建并初始化
//        Person *person;
//        person = [[Person alloc] init ];
//        NSLog(@"person:%p",person);
        
        //对象创建并初始化，内存分析
        Person *person = [[Person alloc] initWithAge:30 identify:342321];
//        NSLog(@"person.age: %d",[person getage]);
        //使用点语法
        NSLog(@"person.age: %d",person.age);
        int age = 23;
        [person setAge:age];
//        NSLog(@"person.age: %d",[person getage]);
        NSLog(@"person.age: %d",person.age);
        [person setAge:++age];
//        NSLog(@"person.age: %d",[person getage]);
        NSLog(@"person.age: %d",person.age);
    }
    return 0;
}

