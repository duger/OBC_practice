//
//  main.m
//  ShapeXYPoint
//
//  Created by Duger on 13-7-28.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Rectangle *myRect = [[Rectangle alloc]init];
        XYPoint *myPoint = [[XYPoint alloc] init];
        
        //设置XYPoint的x和y的值
        [myPoint setX:100 andY:200];
        //设置矩形的宽和高
        [myRect setWidth:6 andHeigh:7];
        
        myRect.origin = myPoint;
        
        NSLog(@"Rectangle w = %d, h = %d",myRect.width,myRect.heigh);
        NSLog(@"Origin at (%d,%d)",myRect.origin.x,myRect.origin.y);
        NSLog(@"Area = %d, Perimeter = %d",[myRect area],[myRect perimeter]);
    }
    return 0;
}

