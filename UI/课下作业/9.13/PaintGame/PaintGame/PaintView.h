//
//  PaintView.h
//  PaintGame
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView

@property(nonatomic,assign) CGPoint preFirstPoint;
@property(nonatomic,assign) CGPoint firstPoint;
@property(nonatomic,assign) CGPoint SecondPoint;

@property(nonatomic,retain) UIImage *myImage;
@property(nonatomic,assign) CGMutablePathRef path;

@end
