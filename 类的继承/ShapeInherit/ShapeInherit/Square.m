//
//  Square.m
//  ShapeInherit
//
//  Created by Duger on 13-7-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Square.h"

@implementation Square

-(void) setSide:(int) s{
    [self setWidth:s andHeigh:s];
}

-(int) side{
    return width;
}
@end
