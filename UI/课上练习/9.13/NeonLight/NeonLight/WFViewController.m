//
//  WFViewController.m
//  NeonLight
//
//  Created by Duger on 13-9-13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//添加灯
-(void)_insertNeonLight
{
    //获取霓虹灯窗口视图
//    UIView *neonView = (UIView *)[self.view viewWithTag:1001];
    UIView *neonView = self.neonView;
    //再添加之前先让窗口内的子视图们变大
    NSArray *subView = neonView.subviews;
    //遍历所有子视图，让子视图的大小根据规律变大
    for (UIView *item in subView) {
        CGRect bounds = item.bounds;
        bounds.size.width += 10;
        bounds.size.height += 10;
        
        if (bounds.size.width > CGRectGetWidth(neonView.bounds)) {
            [item removeFromSuperview];
            continue;
        }
        
        item.bounds = bounds;
    }
    
    //加上一个最小视图
    UIView *minView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
    minView.center = CGPointMake(CGRectGetMidX(neonView.bounds), CGRectGetMidY(neonView.bounds));
    //r= g= b= a=1 随机颜色
    CGFloat r = arc4random()%1000 /1000.0f;
    CGFloat g = arc4random()%1000 /1000.0f;
    CGFloat b = arc4random()%1000 /1000.0f;
    minView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    [neonView addSubview:minView ];
    [minView release];
}



-(void)didClickButton:(UIButton *)sender
{
    NSLog(@"%s",__FUNCTION__);
    //    [self _insertNeonLight];
    
    //实例化定时器对象，每个XX秒执行一次_insertNeonLight
    if ([sender.titleLabel.text isEqualToString:@"stop"]) {
        [sender setTitle:@"start" forState:UIControlStateNormal];
        
        //取消定时器计时
        [timer invalidate];
        return;
    }
    [sender setTitle:@"stop" forState:UIControlStateNormal];
    [self _insertNeonLight];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(_insertNeonLight) userInfo:nil repeats:YES];
}

- (void)dealloc {
    [_neonView release];
    [super dealloc];
}

@end
