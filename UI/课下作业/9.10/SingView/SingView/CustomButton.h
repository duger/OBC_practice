//
//  CustomButton.h
//  SingView
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomButtonDelegate <NSObject>
-(void)showTheLastCount;


@end

@interface CustomButton : UIView
{
    //添加两个按钮的成员变量
    UIButton *grayButton;
    UIButton *orangeButton;
    
}

@property(nonatomic,assign) int x;
@property(nonatomic,assign) int y;

//添加委托对象
@property(nonatomic,assign) id<CustomButtonDelegate> delegate;

-(void)reset;
//翻面
-(void)flip;

//是否为正面
-(BOOL)isOpened;
@end
