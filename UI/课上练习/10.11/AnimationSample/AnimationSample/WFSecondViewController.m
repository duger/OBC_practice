//
//  WFSecondViewController.m
//  AnimationSample
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFSecondViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AnimationLayer.h"


@interface WFSecondViewController ()
//点击手势触发的方法
-(void)didRecognizeTap;
@end

@implementation WFSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //使用CoreAnimation动画
    //1.创建动画视图
    UIView *animationView = [[UIView alloc]init];
    //2.设置动画属性
    animationView.bounds = CGRectMake(0, 0, 200, 200);
    animationView.center = CGPointMake(160, 120);
    animationView.tag = 1001;
    animationView.backgroundColor = [UIColor purpleColor];
    //3.将视图添加到根视图
    [self.view addSubview:animationView];
    
    
    //获取动画视图的默认层layer
    CALayer *layer = animationView.layer;
    
    AnimationLayer *animationLayer = [AnimationLayer layer];
    animationLayer.fillColor = [UIColor orangeColor].CGColor;
    animationLayer.bounds = layer.bounds;
    animationLayer.position = CGPointMake(CGRectGetMidX(layer.bounds), CGRectGetMidY(layer.bounds));
    animationLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [layer addSublayer:animationLayer];
    [animationView release];
    
    //创建tapGesture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizeTap)];
    [self.view addGestureRecognizer:tapGesture];
    [tapGesture release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击手势触发的方法
-(void)didRecognizeTap
{
    
    //获取要实现动画的视图
    UIView *animationView = [self.view viewWithTag:1001];
    
    AnimationLayer *animationLayer = [[animationView.layer sublayers]lastObject];
    [animationLayer reset];
    //创建动画的实例对象
/*    CAAnimation;
    CATransition;
    CAPropertyAnimation;
    CAAnimationGroup;
    {
    CAPropertyAnimation;的两个子类
        CABasicAnimation;
        CAKeyframeAnimation;
    }
 */
    //过渡
/*    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    transition.duration = 2.0f;
    [animationLayer addAnimation:transition forKey:@"肖公子耍大缸"];
    //添加动画层
    [layer addSublayer:animationLayer];
 */
  /*  @(<#expression#>);  
    @[<#objects, ...#>];
    @{<#key#>: <#object, ...#>};
   */
    
 /*   {
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
        //NSNumber : NSValue
        basicAnimation.fromValue = @(animationLayer.cornerRadius);
        basicAnimation.byValue = @(10);
        basicAnimation.toValue = @(50);
        
        basicAnimation.duration = 10.0f;
        
        [animationLayer addAnimation:basicAnimation forKey:@"xiaoxiao"];
        animationLayer.cornerRadius = 5;
//        [layer addSublayer:animationLayer];
        
    }*/
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation
                                               animationWithKeyPath:@"borderWidth"];
    keyFrameAnimation.values = @[@0,@2.5,@3.0,@4.5,@5];
    keyFrameAnimation.duration = 2.5f;
    [animationLayer addAnimation:keyFrameAnimation forKey:nil];
    animationLayer.borderWidth = 5.0f;
    
    
}

@end
