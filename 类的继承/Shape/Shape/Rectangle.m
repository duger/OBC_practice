//
//  Rectangle.m
//  Shape
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize width,heigh;

-(int) area{
    return width * heigh;
}
-(int) perimeter{
    return (width + heigh)* 2;
}
-(void) setWidth:(int) w andHeigh: (int) h{
    width = w;
    heigh = h;
}

@end
