//
//  Person.h
//  PersonGetSet
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@interface Person : NSObject
{
    int myNumber;
    int age;
    NSString *name;
    
    Student *student;
}


@property(nonatomic) int myNumber;

//普通的get和set方法
//-(int) myNumber;
//-(void) setMyNumber:(int) _number;
//-(void) printInfo;

@end
