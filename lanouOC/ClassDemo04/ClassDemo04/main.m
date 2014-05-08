//
//  main.m
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Zombie.h"
#import "Car.h"
#import "Person.h"
#import "Student.h"
#import "MyClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
 /*       Zombie *zombie1 = [[Zombie alloc]init];
        NSLog(@"%ld",[zombie1 retainCount]);
        [zombie1 retain];
        NSLog(@"zombie1: %ld",[zombie1 retainCount]);
        
        Zombie *zombie2 = zombie1;
        NSLog(@"zombie2: %ld",[zombie2 retainCount]);
        [zombie2 release];
        NSLog(@"zombie1: %ld",[zombie1 retainCount]);
        [zombie1 release];
        NSLog(@"zombie1: %ld",[zombie1 retainCount]);
  */
        
  /*      Car *jiedaCar = [[Car alloc]init];
        Person *dady = [[Person alloc]init];
        [dady setCar:jiedaCar];
        
        [[dady car]carMove];
        
        Person *mama =[[Person alloc] init];
        [mama setCar:jiedaCar];
        Person *son = [[Person alloc] init];
        [son setCar:jiedaCar];
    */
        
    Student *student1 = [[Student alloc]initWithName:@"小唐" age:40 sex:@"nan" address:@"唐朝" hobby:@"念经"];
    MyClass *myClass = [[MyClass alloc]init];
    myClass.stu = student1;
    
    Student *student2 = [[Student alloc]initWithName:@"猴哥" age:1000 sex:@"男" address:@"花果山" hobby:@"吃桃"];
    [student1 release];
    
    [myClass.stu sayHi];
    myClass.stu = student2;
    [myClass.stu sayHi];
    [myClass release];
  
    }
    return 0;
}

