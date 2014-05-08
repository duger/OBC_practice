//
//  WFFirstViewController.m
//  AnimationSample
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFFirstViewController.h"

@interface WFFirstViewController ()
-(void)didRecognizeGesture:(UITapGestureRecognizer *)sender;
@end

@implementation WFFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

#define kAnimationViewTag 1001
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //实现视图动画
    {
        //1.创建动画视图
        UIView *animationView = [[UIView alloc]init];
        //2.设置动画视图的初始属性
        animationView.bounds = CGRectMake(0, 0, 200, 200);
        animationView.center = CGPointMake(160, 120);
        animationView.tag = kAnimationViewTag;
        animationView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        //3.将动画视图添加到根视图
        [self.view addSubview:animationView];
        [animationView release];
        
        //创建动画手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizeGesture:)];
        [self.view addGestureRecognizer:tap];
        [tap release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)didRecognizeGesture:(UITapGestureRecognizer *)sender
{
    //实现视图动画
    //1.获取动画视图
    UIView *animationView = [self.view viewWithTag:kAnimationViewTag];
    //2.完成动画
    CGFloat targetWidth = arc4random() %120 + 100;
    CGRect targetBounds = CGRectMake(0, 0, targetWidth, targetWidth);
    
    //启动动画1
 /*   
    [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animationView.bounds = targetBounds;
        animationView.alpha = (animationView.alpha == 1.0f)? 0.0f:1.0f;
    } completion:^(BOOL finished) {
        NSLog(@"%@",[NSDate date]);
    }];
 */
    
    //启动动画2
    [UIView beginAnimations:nil context:NULL];
    //设置动画属性
    [UIView setAnimationDuration:2.0f];
    //是否从当前状态开始动画
    [UIView setAnimationBeginsFromCurrentState:YES];
    //设置动画速度曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //设置动画延迟
    [UIView setAnimationDelay:0.0f];
    //触发动作
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
    //设置动画是否能反向执行
    [UIView setAnimationRepeatAutoreverses:YES];
    //设置重复次数
    [UIView setAnimationRepeatCount:2];
    //设置动画是否执行
    [UIView setAnimationsEnabled:YES];
    //设置动画开始日期
//    [UIView setAnimationStartDate:<#(NSDate *)#>];
    //实现怎样的过渡
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:animationView cache:YES];
    //设置视图的属性动画
    animationView.transform = CGAffineTransformMakeRotation(30 / 180.0f * M_PI);
    
    
    [UIView commitAnimations];
}

@end
