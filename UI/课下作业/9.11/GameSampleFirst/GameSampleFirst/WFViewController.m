//
//  WFViewController.m
//  GameSampleFirst
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "WFButton.h"
#define XLINE 5
#define YLINE 5

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSMutableArray *myButtonList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //建立一个实例化按钮数组
    myButtonList = [[NSMutableArray alloc]init];
    
    //Button边长 大小
    CGFloat side = 50.0f;
    //button间的空隙
    CGFloat margin = (320.0f - side * 5) / 6.0f;
    
    
    for (NSInteger y = 0; y < YLINE; y++) {
        //button中心坐标y = 边长 * y + 一半边长 + 空隙* （y + 1）+ 50 (为标题栏留空)
        CGFloat pointY = side * y + side / 2 + margin * (y + 1) + 60.0f;
        for (NSInteger x = 0; x < XLINE; x++) {
            CGFloat pointX = side * x + side / 2 + margin * (x + 1);
            //实例化WFButton 
            WFButton *myButton = [[WFButton alloc]initWithFrame:CGRectMake(0, 0, side, side)];
            //设置myButton位置
            myButton.center = CGPointMake( pointX, pointY);
            //给myButton的x y 赋值
            myButton.x = x;
            myButton.y = y;
            //给每个myButton设tag值
            myButton.tag = y * 1000 + x + 1;
            //指定委托对象
            myButton.delegate = self;
            [myButtonList addObject:myButton];
            [self.view addSubview:myButton];
            [myButton release];
            
        }
    }
    
    //制作标题栏
    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //标题栏设置 不可点击 背景颜色 字体内容 字体颜色 字体居中 字体样式大小
    title.userInteractionEnabled = NO;
    title.backgroundColor = [UIColor purpleColor];
    title.font = [UIFont fontWithName:@"Arial" size:40.0f];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"等灯等灯";
    title.tag = 77;
    [self.view addSubview:title];
    [title release];
    
    //制作reset按钮
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetButton.frame = CGRectMake(0, 0, 100, 50);
    //设置按钮位置
    resetButton.center = CGPointMake(160, 415);
//    resetButton.titleLabel.text = @"reset";
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [resetButton setTitle:@"RESET" forState:UIControlStateHighlighted];
    resetButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:23.0f];


    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
//    [resetButton release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [myButtonList release];
}

- (void)dealloc
{
    [myButtonList release];
    [super dealloc];
}

#pragma mark - private methods
-(void)reset
{
    for (WFButton *button in myButtonList) {
        [button buttonReset];
    }
UITextField *title = (UITextField *)[self.view viewWithTag:77];
title.text = @"0 / 25";
}

-(void)showTheCount
{
    UITextField *title = (UITextField *)[self.view viewWithTag:77];
    NSInteger count = 0;
    for (WFButton *button in myButtonList) {
        if ([button isGray]) {
            count++;
        }
    }
    title.text = [NSString stringWithFormat:@"%d / 25",count];
}
@end
