//
//  CustomButton.m
//  SingView
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton()

-(CustomButton *)up;
-(CustomButton *)down;
-(CustomButton *)left;
-(CustomButton *)right;

-(BOOL)isValideTag:(NSInteger)tag;

-(void)flipNearBy;


@end

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //实例化两个按钮
        grayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //当前视图的宽度和高度
        CGFloat selfWith = frame.size.width;
        CGFloat selfHeigh = CGRectGetHeight(frame);
        
        CGFloat midWith = CGRectGetMidX(self.bounds);
        CGFloat midHeigh = CGRectGetMidY(self.bounds);
        
        grayButton.frame = CGRectMake(0, 0, selfWith - 2, selfHeigh - 2);
        orangeButton.frame = CGRectMake(0, 0, selfWith - 2, selfHeigh - 2);
        
        grayButton.center = CGPointMake(midWith, midHeigh);
        orangeButton.center = CGPointMake(midWith, midHeigh);
        
        self.backgroundColor = [UIColor blackColor];
        grayButton.backgroundColor = [UIColor grayColor];
        orangeButton.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:grayButton];
        [self addSubview:orangeButton];
        
        //触发事件
        [grayButton addTarget:self action:@selector(didClickGrayButton) forControlEvents:UIControlEventTouchUpInside];
        [orangeButton addTarget:self action:@selector(didClickOrangeButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)didClickGrayButton
{
//    orangeButton.hidden = YES;
    [self flip];
    [self flipNearBy];
    
    [self.delegate showTheLastCount];
}

-(void)didClickOrangeButton
{
//    orangeButton.hidden = NO;
    [self flip];
    [self flipNearBy];

    [self.delegate showTheLastCount];
}


//reset 方法
-(void)reset
{
    orangeButton.hidden = NO;
}

-(void)flip
{
    orangeButton.hidden = !orangeButton.hidden;
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
-(CustomButton *)up;
{
    CustomButton *result = nil;
    
    NSInteger upTag = (self.x - 1) * 10000 + self.y + 1;
    if ([self isValideTag:upTag]) {
        result = (CustomButton *)[self.superview viewWithTag:upTag];
    }
    
    return  result;
}
-(CustomButton *)down
{
    CustomButton *result = nil;
    
    NSInteger downTag = (self.x + 1) * 10000 + self.y + 1;
    if ([self isValideTag:downTag]) {
        result = (CustomButton *)[self.superview viewWithTag:downTag];
    }
    
    return  result;
}
-(CustomButton *)left{
    CustomButton *result = nil;
    
    NSInteger leftTag = self.x * 10000 + self.y - 1 +1;
    if ([self isValideTag:leftTag]) {
        result = (CustomButton *)[self.superview viewWithTag:leftTag];
    }
    
    return  result;
    
}
-(CustomButton *)right{
    CustomButton *result = nil;
    
    NSInteger rightTag = self.x * 10000 + self.y + 1 +1;
    if ([self isValideTag:rightTag]) {
        result = (CustomButton *)[self.superview viewWithTag:rightTag];
    }
    
    return  result;
}

-(BOOL)isValideTag:(NSInteger)tag
{
    return ((tag >= 1 && tag <= 5)||
    (tag >= 10001 && tag <= 10005)||
    (tag >= 20001 && tag <= 20005)||
    (tag >= 30001 && tag <= 30005)||
    (tag >= 40001 && tag <= 40005));
}

-(void)flipNearBy{
    [[self up] flip];
    [[self down] flip];
    [[self left] flip];
    [[self right] flip];
}

//是否为正面
-(BOOL)isOpened
{
    return !orangeButton.hidden;
}

@end
