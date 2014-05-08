//
//  customView.h
//  NewLightGame
//
//  Created by Duger on 13-9-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customViewDelegate <NSObject>

-(void)showTheCount;

@end

@interface customView : UIView

@property(nonatomic,assign) UIView *upView;
@property(nonatomic,assign) UIView *downView;

@property(nonatomic,assign) NSInteger x;
@property(nonatomic,assign) NSInteger y;

@property(nonatomic,assign) id<customViewDelegate> delegate;

-(BOOL)isClear;
-(void)viewReset;
@end
