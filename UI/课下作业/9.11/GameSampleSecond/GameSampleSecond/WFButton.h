//
//  WFButton.h
//  GameSampleSecond
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WFButtonDelegate <NSObject>

-(void)showTheCount;

@end

@interface WFButton : UIView
{
    UIButton *orangeButton;
    UIButton *grayButton;
    
}
@property(nonatomic,assign) NSInteger x;
@property(nonatomic,assign) NSInteger y;

//添加委托对象
@property(nonatomic,assign) id<WFButtonDelegate> delegate;

//重置button
-(void)buttonReset;

//是不是灰色（开灯）
-(BOOL)isGray;
@end
