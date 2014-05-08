//
//  WFViewController.m
//  SingleViewSampleWithXib
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "UITextField+Addtion.h"
@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = CGRectMake(0, 0, 100, 30);
    textField.center = CGPointMake(160, 50);
    //文本输入样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.tag = 2002;
    [self.view addSubview:textField];
    [textField release];
    
    
    //黑边框怎么实现
    //方法一 容器视图
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 52, 52)];
    //将容器视图放在控制器视图的中心
    containerView.center = self.view.center;
    //设置容器视图的颜色
    containerView.backgroundColor = [UIColor blackColor];
    
    //创建按钮视图
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮是视图的大小
    btn.frame = CGRectMake(0, 0, 50, 50);
    //设置按钮视图的中心
    btn.center = CGPointMake(26, 26);
    //设置按钮视图的背景色
    btn.backgroundColor = [UIColor grayColor];
    
    //创建第二个按钮视图
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮是视图的大小
    btn2.frame = CGRectMake(0, 0, 50, 50);
    //设置按钮视图的中心
    btn2.center = CGPointMake(26, 26);
    //设置按钮视图的背景色
    btn2.backgroundColor = [UIColor orangeColor];

    [containerView addSubview:btn];
    [containerView addSubview:btn2];
    [self.view addSubview:containerView];
    
    //怎样通过父视图获取子视图
    containerView.tag = 1001;
    btn.tag = 10000;
    btn2.tag = 10001;
    
    //
    [btn addTarget:self action:@selector(didClickGrayButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(didClickOrangeButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)didClickGrayButton:(id)sender
{
    UIView *containerView = [self.view viewWithTag:1001];
    UIButton *orangeButton = (UIButton *)[containerView viewWithTag:10001];
    //设置隐藏某个视图
    orangeButton.hidden = NO;
    
    //获取对应的文本框
    UITextField *textField = (UITextField *)[self.view viewWithTag:2002];
    //发送类目内的消息
    [textField scale];
    
}
-(void)didClickOrangeButton:(id)sender
{
    UIView *containerView = [self.view viewWithTag:1001];
    UIButton *orangeButton = (UIButton *)[containerView viewWithTag:10001];
    //设置隐藏某个视图
    orangeButton.hidden = YES;
}
@end
