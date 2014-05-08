//
//  UITextField+Addtion.m
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UITextField+Addtion.h"

@implementation UITextField (Addtion)
-(void)scale
{
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(1.15f, 1.0f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        } completion:^(BOOL finished) {
            ;
        }];
    }];
}

@end
