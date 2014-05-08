//
//  UIButton+Addtion.m
//  UIHomeWork01
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UIButton+Addtion.h"

@implementation UIButton (Addtion)
-(void)buttonActive:(UIButton *)btn2
{
[self addTarget:self action:@selector(didClickGrayButton:) forControlEvents:UIControlEventTouchUpInside];
[btn2 addTarget:self action:@selector(didClickOrangeButton:) forControlEvents:UIControlEventTouchUpInside];
    
}


@end
