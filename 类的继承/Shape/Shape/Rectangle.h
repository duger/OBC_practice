//
//  Rectangle.h
//  Shape
//
//  Created by Duger on 13-7-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject
{
    int width;
    int heigh;
    
}
@property(nonatomic) int width,heigh;

-(int) area;
-(int) perimeter;
-(void) setWidth:(int) w andHeigh: (int) h;

@end
