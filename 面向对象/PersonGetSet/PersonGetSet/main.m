//
//  main.m
//  PersonGetSet
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Person *person = [[Person alloc] init];
        [person setMyNumber:300];
        person.myNumber = 100;
        NSLog(@"Person number is : %d",[person myNumber]);
        
        
    }
    return 0;
}

