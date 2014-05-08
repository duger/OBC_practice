//
//  WFViewController.m
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

//extension 延展
//为封装类添加方法
@interface WFViewController ()
-(void)didClicked:(id)sender;
@end

@implementation WFViewController

//加载视图控制器属性
-(void)loadView
{
    /*方法一
    UIView *selfView = [[UIView alloc]init];
    selfView.frame = [[UIScreen mainScreen]bounds];
    selfView.backgroundColor = [UIColor grayColor];
    self.view = selfView;
     
     NSLog(@"%s__%@",__FUNCTION__,self.view);
     */
    //方法二
    [super loadView];
    
    NSLog(@"%s__",__FUNCTION__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",__FUNCTION__);
    
    //创建视图控制器的视图树
    //创建一个按钮类的实例对象
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置btn的frame属性
    [btn setFrame:CGRectMake(115, 215, 100, 50)];
    //设置btn的文字title
    [btn setTitle:@"click" forState:UIControlStateNormal];
    //设置btn的文字title
    [btn setTitle:@"clicked" forState:UIControlStateHighlighted];
    //将按钮视图添加到视图树上
    [self.view addSubview:btn];
    //为按钮实例对象添加触发的方法
    [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)didClicked:(id)sender
{
    //提醒视图
    	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"恭喜发财！" delegate:nil cancelButtonTitle:@"等等" otherButtonTitles:@"好的！", nil];
    //弹出提醒视图
    [alert show];
    [alert release];
}

@end
