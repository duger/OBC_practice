//
//  CustomButton.h
//  SimpleDraw_3
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIView

@property(nonatomic,assign) CGPoint preFirstPoint;
@property(nonatomic,assign) CGPoint firstPoint;
@property(nonatomic,assign) CGPoint secondPoint;
@property(nonatomic,retain) UIImage *currentImage;

@end
