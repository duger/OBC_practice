//
//  main.m
//  ShapeInherit
//
//  Created by Duger on 13-7-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Square *sq = [[Square alloc] init];
        
        [sq setSide:6];
        NSLog(@"Square side = %d",[sq side]);
        NSLog(@"Square Area = %d , Perimeter = %d ",[sq area],[sq perimeter]);
    
    }
    return 0;
}

