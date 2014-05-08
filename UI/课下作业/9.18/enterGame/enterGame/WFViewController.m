//
//  WFViewController.m
//  enterGame
//
//  Created by Duger on 13-9-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController
@synthesize PointY;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PointY = 0;
    self.view.backgroundColor = [UIColor purpleColor];

    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0 , 300, self.view.bounds.size.height - 40)];
    scrollView.center = CGPointMake(self.view.center.x, self.view.center.y);
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.tag = 1008;

    [self.view addSubview:scrollView];
    
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds)-20, CGRectGetHeight(self.view.bounds) );
    scrollView.contentOffset = CGPointMake(0, 0);
//    scrollView.contentInset = (0,100);
    scrollView.delegate = self;
    
    //点击其他地方 关闭键盘
    UITapGestureRecognizer *tapOtherPlace = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeKeyboard:)];
    [scrollView addGestureRecognizer:tapOtherPlace];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0,280 , 40)];
    textField.center = CGPointMake(150 , 20 + 20 + PointY * 5 + (PointY) * 40);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 101;
    [scrollView addSubview:textField];
    textField.delegate = self;
//    PointY = scrollView.center.y;

    if (PointY > 4) {
        [scrollView scrollRectToVisible:CGRectMake(50, 50, 320, 620) animated:YES];
    }
    
    [scrollView release];
    
}


-(void)removeKeyboard:(id *)sender
{
    for (int i = 0; i <= PointY; i++) {
        UITextField *textfield = (UITextField *)[self.view.superview viewWithTag:101 + i];
        [textfield resignFirstResponder];
    }
//    for (UITextField *item in self.view.superview.subviews) {
//        [item resignFirstResponder];
//    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark - delecate methods
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return YES;
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) - 20, 620 + (PointY - 4) * 45);
        scrollView.contentOffset = CGPointMake(0, 15 + (PointY - 4)* 45);
    
//        scrollView.contentOffset = CGPointMake(0, (PointY - 3) * 45 );
    
        
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if ([textField.text isEqualToString:@""]) {
        [textField resignFirstResponder];
        return YES;
        }
        PointY += 1;
        
        UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 280, 40)];
        textField1.center = CGPointMake(150, 20 + 20 + PointY * 5 + (PointY) * 40);
        textField1.borderStyle = UITextBorderStyleRoundedRect;
        textField1.tag = 101 + PointY;
        textField1.delegate = self;
//    NSLog(@"frame: x : %f y: %f",textField1.frame.origin.x,textField);
        [textField.superview addSubview:textField1];
        
        NSLog(@"pointY %d",PointY);
    if (PointY >= 5) {
        [self scrollViewDidEndScrollingAnimation:(UIScrollView *)textField.superview];
    }
    
        [textField resignFirstResponder];
        [textField1 becomeFirstResponder];
        [textField1 release];
 

    return YES;
}
@end
