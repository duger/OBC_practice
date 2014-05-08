//
//  CustomView.m
//  ThreadPractice2
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 20, 300, 300)];
        self.textView.backgroundColor = [UIColor lightTextColor];
        self.textView.editable = NO;
        self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.button setTitle:@"Start" forState:UIControlStateNormal];
        [self.button setFrame:CGRectMake(0, 0, 80, 50)];
        self.button.center = CGPointMake(160, 350);
        
        [self.button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.textView];
        [self addSubview:self.button];
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

-(void)didClickButton:(UIButton *)button
{
    [self.delegate clickButton:button];
}

#pragma mark - private method
-(void)_threadMethod:(id)sender
{
    //通过让线程休眠，模拟大数据处理或者是网络请求数据
    //    [NSThread sleepForTimeInterval:3.0f];
    //添加定时器，每隔1秒添加事件
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    //添加循环等待用户响应
    [[NSRunLoop currentRunLoop] run];
    
}

-(void)_timerMethod
{
    
    if ([[NSThread currentThread] isCancelled]) {
        [NSThread exit];
    }
    //通过让线程休眠，模拟大数据处理或者是网络请求数据
    [NSThread sleepForTimeInterval:1.0f];
    //主线程中修改文本编辑框中的文字
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
}

//主线程刷新方法
-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date]description];
    text = [text stringByAppendingFormat:@"\n%@",date];
    self.textView.text = text;
}


@end
