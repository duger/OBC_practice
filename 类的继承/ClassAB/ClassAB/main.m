//
//  main.m
//  ClassAB
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        ClassB *b = [[ClassB alloc] init];
        [b initVar];
        [b printVar];
        
        [b release];
    
        
        
    }
    return 0;
}

