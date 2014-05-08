//
//  XYPoint.h
//  ShapeXYPoint
//
//  Created by Duger on 13-7-28.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPoint : NSObject
{
    int x;
    int y;
    
}
@property (nonatomic) int x,y;

-(void) setX:(int) xVal andY: (int) yVal;

@end
