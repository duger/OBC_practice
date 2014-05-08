//
//  WFsView.h
//  DrawWark
//
//  Created by Duger on 13-9-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFsView : UIView

@property(assign,nonatomic) CGPoint prePoint;
@property(assign,nonatomic) CGPoint thePoint;
@property(assign,nonatomic) CGPoint lastPoint;
@property(retain,nonatomic) UIImage *myImage;
@property(assign,nonatomic) CGFloat lingwidth;

@property(assign,nonatomic) CGMutablePathRef path;


@property(assign,nonatomic) CFMutableArrayRef lineArray;
-(void)roDo;
-(UIImage *)getMyImage;
@end
