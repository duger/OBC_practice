//
//  myButton.m
//  GameSampleThird
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "myButton.h"

@implementation myButton
@synthesize orangeButton,grayButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        //实例化两个button
        grayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //视图宽高 和 中点
        CGFloat viewWidth = CGRectGetWidth(frame);
        CGFloat viewHeigh = CGRectGetHeight(frame);
        CGFloat pointWidth = CGRectGetMidX(self.bounds);
        CGFloat pointHeigh = CGRectGetMidY(self.bounds);
        //设置按钮大小
        grayButton.frame = CGRectMake(0, 0, viewWidth - 2, viewHeigh -2 );
        orangeButton.frame = CGRectMake(0, 0, viewWidth - 2, viewHeigh - 2);
        //设置位置
        grayButton.center = CGPointMake(pointWidth, pointHeigh);
        orangeButton.center = CGPointMake(pointWidth, pointHeigh);
        
        //颜色
        self.backgroundColor = [UIColor blackColor];
        grayButton.backgroundColor = [UIColor grayColor];
        orangeButton.backgroundColor = [UIColor orangeColor];
        
        //加入视图
        [self addSubview:grayButton];
        [self addSubview:orangeButton];
        
        
        //触发事件
        [grayButton addTarget:self action:@selector(didClickedGrayButton) forControlEvents:UIControlEventTouchUpInside];
        [orangeButton addTarget:self action:@selector(didClickedOrangeButton) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }
    return self;
}


-(void)reset
{
    orangeButton.hidden = NO;
}

-(void)didClickedGrayButton
{
    [self allTurned];
    [self.delegate showTheCount];
}
-(void)didClickedOrangeButton
{
    [self allTurned];
    [self.delegate showTheCount];
}

-(void)turned
{
    orangeButton.hidden = !orangeButton.hidden;
}

-(void)allTurned
{
    [self turned];
    [[self up] turned];
    [[self down] turned];
    [[self left] turned];
    [[self right] turned];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - private methods

-(myButton *)up
{
    CGFloat upTag = self.x + (self.y - 1) * 1000;
    myButton *button = nil;
    if ([self isUseAble:upTag]) {
        button = (myButton *)[self.superview viewWithTag:upTag];
    }
    return button;
}
-(myButton *)down
{
    CGFloat downTag = self.x + (self.y +1) * 1000;
    myButton *button = nil;
    if ([self isUseAble:downTag]) {
        button = (myButton *)[self.superview viewWithTag:downTag];
    }
    return button;
}

-(myButton *)left
{
    CGFloat leftTag = self.x -1 + self.y * 1000;
    myButton *button = nil;
    if ([self isUseAble:leftTag]) {
        button = (myButton *)[self.superview viewWithTag:leftTag];
    }
    return button;
}

-(myButton *)right
{
    CGFloat rightTag = self.x + 1 + self.y * 1000;
    myButton *button = nil;
    if ([self isUseAble:rightTag]) {
        button = (myButton *)[self.superview viewWithTag:rightTag];
    }
    return button;
}


-(BOOL)isUseAble:(CGFloat)tag
{
    return ((tag >= 1001 && tag <= 1005)||
            (tag >= 2001 && tag <= 2005)||
            (tag >= 3001 && tag <= 3005)||
            (tag >= 4001 && tag <= 4005)||
            (tag >= 5001 && tag <= 5005));
}


@end
