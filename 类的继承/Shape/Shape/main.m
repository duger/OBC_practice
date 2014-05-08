//
//  main.m
//  Shape
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Rectangle *myRect = [[Rectangle alloc] init];
        [myRect setWidth:5 andHeigh:7];
        
        NSLog(@"Rectangle : w=%d, h = %d",myRect.width,myRect.heigh);
        NSLog(@"Rectangle : area = %d,perimeter = %d",[myRect area],[myRect perimeter]);
        
        
    }
    return 0;
}

