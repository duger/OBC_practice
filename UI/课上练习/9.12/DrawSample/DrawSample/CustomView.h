//
//  CustomView.h
//  DrawSample
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
//第一个点的前一个点
@property(nonatomic,assign) CGPoint preFirstPoint;
@property(nonatomic,assign) CGPoint firstPoint;
@property(nonatomic,assign) CGPoint secondPoint;

@property(nonatomic,retain) UIImage *currentImage;


@end
