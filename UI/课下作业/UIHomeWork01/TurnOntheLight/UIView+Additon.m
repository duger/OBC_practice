//
//  UIView+Additon.m
//  UIHomeWork01
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UIView+Additon.h"

@implementation UIView (Additon)

-(void)makeButtonDownside:(UIButton *)btn1 andButtonUpside:(UIButton *)btn2
{
    [self setFrame:CGRectMake(0, 0, 52, 52)];
    self.backgroundColor = [UIColor blackColor];
    
    btn1.frame = CGRectMake(0, 0, 50, 50);
    btn1.center = CGPointMake(26, 26);
    btn1.backgroundColor = [UIColor grayColor];
    
    btn2.frame = CGRectMake(0, 0, 50, 50);
    btn2.center = CGPointMake(26, 26);
    btn2.backgroundColor = [UIColor orangeColor];
    
    [self addSubview:btn1];
    [self addSubview:btn2];
    
    
    //    [self.view addSubview:containerView];
}
-(void)buttonActive:(UIButton *)btn1 and:(UIButton *)btn2
{
    [btn2 addTarget:self action:@selector(didClickGrayButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 addTarget:self action:@selector(didClickOrangeButton:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - private methods
-(void)didClickGrayButton:(id)sender
{
//    UIView *containerView = [self viewWithTag:1001];
    UIButton *orangeButton = (UIButton *)[self viewWithTag:(self.tag + 9000)];
    NSLog(@"%d",(self.tag + 9000));
    //设置隐藏某个视图
    orangeButton.hidden = NO;
    
    if ((self.tag - 5) >= 1001 ) {
        UIView *containerView = [self viewWithTag:(self.tag - 5)];
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag - 5 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = NO;
    }
    if ((self.tag + 5) <= 1025 ) {
        UIView *containerView = [self viewWithTag:(self.tag + 5)];
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag + 5 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = NO;
    }
    if ((self.tag - 1) >= 1001 ) {
        UIView *containerView = [self viewWithTag:(self.tag - 1)];
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag - 1 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = NO;
    }
    if ((self.tag + 1) >= 1001 ) {
        UIView *containerView = [self viewWithTag:(self.tag + 1)];
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag + 1 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = NO;
    }

    
    
}
-(void)didClickOrangeButton:(id)sender
{
//        UIView *containerView = [self viewWithTag:1001];
    UIButton *orangeButton = (UIButton *)[self viewWithTag:(self.tag + 9000)];
    //设置隐藏某个视图
    orangeButton.hidden = YES;
    
    if ((self.tag - 5) >= 1001 ) {
//        UIView *containerView = [self viewWithTag:(view1.tag - 5)];
        UIButton *orangeButton = (UIButton *)[self viewWithTag:(self.tag - 5 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = YES;
        NSLog(@"上：%d",self.tag + 8995);
    }
    if ((self.tag + 5) <= 1025 ) {
        UIView *containerView = [self viewWithTag:(self.tag + 5)];
        NSLog(@"下：%d",self.tag + 5);
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag + 5 + 9000)];
        NSLog(@"下：%d",self.tag + 9005);
        //设置隐藏某个视图
        orangeButton.hidden = YES;
    }
    if ((self.tag - 1) >= 1001 ) {
        UIView *containerView = [self viewWithTag:(self.tag - 1)];
        UIButton *orangeButton = (UIButton *)[containerView viewWithTag:(self.tag - 1 + 9000)];
        //设置隐藏某个视图
        orangeButton.hidden = YES;
        NSLog(@"左：%d",self.tag + 8999);
    }
    if ((self.tag + 1) >= 1001 ) {
        UIView *containerView = [self viewWithTag:(self.tag + 1)];
        
        UIButton *orangeButton1 = (UIButton *)[containerView viewWithTag:(self.tag + 9001)];
        //设置隐藏某个视图
        orangeButton1.hidden = YES;
        NSLog(@"右：%d",self.tag + 9001);
    }


}
@end
