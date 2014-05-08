//
//  WFViewController.m
//  ScrollSample
//
//  Created by Duger on 13-9-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    if ([self conformsToProtocol:@protocol(UIScrollViewDelegate) ]) {
        NSLog(@"遵守了协议！");
    }
    if ([self respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        NSLog(@"ViewController 实现了这个方法·");
    }
    
    //指定控制器的实例对象为UIscorllView实例对象scrollView的代理对象
    UIScrollView *scrollView = nil;
    //实例化UIScrollView实例对象
    scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //指定代理对象
    scrollView.delegate = self;
    //
    [self.view addSubview:scrollView];
    
    //    for (int i = 0; i < 9; i++) {
    UIView *item1 = [[UIView alloc]initWithFrame:self.view.bounds];
    item1.center = CGPointMake(160, 250);
    UIView *item2 = [[UIView alloc]initWithFrame:self.view.bounds];
    item2.center = CGPointMake(480, 250);
    UIView *item3 = [[UIView alloc]initWithFrame:self.view.bounds];
    item3.center = CGPointMake(800, 250);
    UIView *item4 = [[UIView alloc]initWithFrame:self.view.bounds];
    item4.center = CGPointMake(160, 710);
    UIView *item5 = [[UIView alloc]initWithFrame:self.view.bounds];
    item5.center = CGPointMake(480, 710);
    UIView *item6 = [[UIView alloc]initWithFrame:self.view.bounds];
    item6.center = CGPointMake(800, 710);
    UIView *item7 = [[UIView alloc]initWithFrame:self.view.bounds];
    item7.center = CGPointMake(160, 1170);
    
    UIView *item8 = [[UIView alloc]initWithFrame:self.view.bounds];
    item8.center = CGPointMake(480, 1170);
    
    UIView *item9 = [[UIView alloc]initWithFrame:self.view.bounds];
    item9.center = CGPointMake(800, 1170);
    
    
    item1.backgroundColor = [UIColor yellowColor];
    item2.backgroundColor = [UIColor purpleColor];
    item3.backgroundColor = [UIColor yellowColor];
    item4.backgroundColor = [UIColor purpleColor];
    item5.backgroundColor = [UIColor yellowColor];
    item6.backgroundColor = [UIColor purpleColor];
    item7.backgroundColor = [UIColor yellowColor];
    item8.backgroundColor = [UIColor purpleColor];
    item9.backgroundColor = [UIColor yellowColor];
    
    [scrollView addSubview:item1];
    [scrollView addSubview:item2];
    [scrollView addSubview:item3];
    [scrollView addSubview:item4];
    [scrollView addSubview:item5];
    [scrollView addSubview:item6];
    [scrollView addSubview:item7];
    [scrollView addSubview:item8];
    [scrollView addSubview:item9];
    

    
    
    //想要让滚动视图滚动，要设置！
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds)*4 , CGRectGetHeight(self.view.bounds));
    //起始位置偏差
    scrollView.contentOffset = CGPointMake(100, 0);
    //
//    scrollView.pagingEnabled = YES;
    //
//    scrollView.scrollsToTop = YES;
    
//    scrollView.bounces = NO;
    
//    scrollView.zoomScale = 1.5f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%s",__FUNCTION__);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews objectAtIndex:1];
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    view.transform = CGAffineTransformMakeScale(scale, scale);
}
@end
