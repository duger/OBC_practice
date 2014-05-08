//
//  WFViewController.m
//  ViewControllerSample
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    //实例化“父”视图
    UIView *orangeView = [[UIView alloc]init];
    //设置大小
    orangeView.frame = CGRectMake(0, 0, 200, 200);
    //设置父视图中心位置
    orangeView.center = CGPointMake(160, 120);
    //设置背景颜色
    orangeView.backgroundColor = [UIColor orangeColor];
    //设置父视图的tag
    orangeView.tag = 1001;
    
    //实例化子视图
    UIView *blueView = [[UIView alloc]init];
    blueView.frame = CGRectMake(0, 0, 100, 100);
    blueView.center = CGPointMake(100, 100);
    blueView.backgroundColor = [UIColor blueColor];
    
    
    /*
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     */
    
    
    //设置子视图的自动变化
    blueView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ;
    orangeView.autoresizesSubviews = YES;
    
    
    UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [subBtn setFrame:CGRectMake(0, 0, 60, 30)];
    [subBtn setTitle:@"-" forState:UIControlStateNormal];
    [subBtn setCenter:CGPointMake(80, 300)];
    [subBtn addTarget:self action:@selector(didClickSubBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *increaseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [increaseBtn setFrame:CGRectMake(0, 0, 60, 30)];
    [increaseBtn setTitle:@"+" forState:UIControlStateNormal];
    [increaseBtn setCenter:CGPointMake(270, 300)];
    [increaseBtn addTarget:self action:@selector(didClickIncreaseBtn) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:orangeView];
    [self.view   addSubview:subBtn];
    [self.view addSubview:increaseBtn];
    [orangeView addSubview:blueView];
    
    [orangeView release];
    [blueView release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override methods
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - public methods
-(void)didClickSubBtn
{
    UIView *orangeView = [self.view viewWithTag:1001];
    CGRect bounds = orangeView.bounds;
    
    bounds.size.width -= 2;
    bounds.size.height -= 2;
    
    orangeView.bounds = bounds;
}

-(void)didClickIncreaseBtn
{
    UIView *orangeView = [self.view viewWithTag:1001];
    CGRect bounds = orangeView.bounds;
    
    bounds.size.width += 2;
    bounds.size.height += 2;
    
    orangeView.bounds = bounds;
    
}

@end
