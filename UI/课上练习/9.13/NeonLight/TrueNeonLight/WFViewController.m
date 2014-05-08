//
//  WFViewController.m
//  TrueNeonLight
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

//添加灯
-(void)_insertNeonLight;


@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //创建一个按钮，命名为start，添加didClickButton 事件
    
    UIButton *startbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startbutton.frame = CGRectMake(0, 0, 320, 60);
    startbutton.tag = 77;
    [startbutton setTitle:@"Start" forState:UIControlStateNormal];
    startbutton.titleLabel.font = [UIFont fontWithName:@"Arail" size:30.0f];
    [startbutton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startbutton];
    //将按钮移动到中心点为160，400的位置
    //创建一个白色视图 300 * 300 ，作为霓虹灯的窗口 tag 1001 ，中心点160，160
    
    startbutton.center = CGPointMake(160, 400);
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    myView.center = CGPointMake(160, 160);
    myView.backgroundColor = [UIColor whiteColor];
    myView.tag = 1001;
    myView.clipsToBounds = YES;
    
    [self.view addSubview:myView];
    [myView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
//添加灯
-(void)_insertNeonLight
{
    //获取霓虹灯窗口视图
    UIView *neonView = (UIView *)[self.view viewWithTag:1001];
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


#pragma mark - private methods
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
//    [self _insertNeonLight];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(_insertNeonLight) userInfo:nil repeats:YES];
}

- (void)dealloc {
    [_neonView release];
    [super dealloc];
}
@end
