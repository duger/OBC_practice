//
//  WFButton.m
//  GameSampleSecond
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFButton.h"


@implementation WFButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //实例化两个按钮
        grayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //得到视图的宽和高
        CGFloat viewHigh = CGRectGetHeight(frame);
        CGFloat viewWidth = CGRectGetWidth(frame);
        
        //得到视图的中心
        CGFloat pointWidth = CGRectGetMidX(self.bounds);
        CGFloat pointHeigh = CGRectGetMidY(self.bounds);
        
        //设置button大小
        grayButton.frame = CGRectMake(0, 0, viewWidth - 2,viewHigh - 2);
        orangeButton.frame = CGRectMake(0, 0, viewWidth - 2, viewHigh - 2);
        //设置button位置
        grayButton.center = CGPointMake(pointWidth, pointHeigh);
        orangeButton.center = CGPointMake(pointWidth, pointHeigh);
        
        
        //颜色
        self.backgroundColor = [UIColor grayColor];
        grayButton.backgroundColor = [UIColor grayColor];
        orangeButton.backgroundColor = [UIColor orangeColor];
        
        //引入视图
        [self addSubview:grayButton];
        [self addSubview:orangeButton];
        
        //触发事件
        
        [grayButton addTarget:self action:@selector(clickGrayButton) forControlEvents:UIControlEventTouchUpInside];
        [orangeButton addTarget:self action:@selector(clickOrangeButton) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)clickGrayButton
{
    //    orangeButton.hidden = NO;
    
    [self allTurned];
    //委托方法
    [self.delegate showTheCount];
}
-(void)clickOrangeButton
{
    //    orangeButton.hidden = YES;
    [self allTurned];
    
    [self.delegate showTheCount];
}

//重置button
-(void)buttonReset
{
    orangeButton.hidden = NO;
}

//翻面儿方法
-(void)turned
{
    orangeButton.hidden = !orangeButton.hidden;
}

//自己和上下左右一起翻
-(void)allTurned
{
    [self turned];
    [[self up] turned];
    [[self down] turned];
    [[self right] turned];
    [[self left]turned];
    
}

//是否是开灯
-(BOOL)isGray
{
    return !orangeButton.hidden;
}

#pragma mark - private methods
//取上下左右的myButton
-(WFButton *)up
{
    WFButton *result = nil;
    NSInteger upTag = (self.y - 1) * 1000 + self.x;
    if ([self isGoodTag:upTag]) {
        result =  (WFButton *)[self.superview viewWithTag:upTag];
    }
    return result;
}

-(WFButton *)down
{
    WFButton *result = nil;
    NSInteger downTag = (self.y + 1) * 1000 + self.x;
    if ([self isGoodTag:downTag]) {
        result = (WFButton *)[self.superview viewWithTag:downTag];
    }
    return result;
}

-(WFButton *)left
{
    WFButton *result = nil;
    NSInteger leftTag = (self.y ) * 1000 + self.x - 1;
    if ([self isGoodTag:leftTag]) {
        result = (WFButton *)[self.superview viewWithTag:leftTag];
    }
    return result;
}

-(WFButton *)right
{
    WFButton *result = nil;
    NSInteger rightTag = (self.y) * 1000 + self.x + 1;
    if ([self isGoodTag:rightTag]) {
        result = (WFButton *)[self.superview viewWithTag:rightTag];
    }
    return result;
}

-(BOOL)isGoodTag:(NSInteger) tag
{
    return ((tag >= 0 && tag <= 4)||
            (tag >= 1000 && tag <= 1004)||
            (tag >= 2000 && tag <= 2004)||
            (tag >= 3000 && tag <= 3004)||
            (tag >= 4000 && tag <= 4004));
}



@end