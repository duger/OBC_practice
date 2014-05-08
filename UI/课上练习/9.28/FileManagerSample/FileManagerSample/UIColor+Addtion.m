//
//  UIColor+Addtion.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UIColor+Addtion.h"

@implementation UIColor (Addtion)

+(id)randomColor{
    CGFloat r = arc4random() % 100 / 100.0f;
    CGFloat g = arc4random() % 100 / 100.0f;
    CGFloat b = arc4random() % 100 / 100.0f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
    
}


@end
