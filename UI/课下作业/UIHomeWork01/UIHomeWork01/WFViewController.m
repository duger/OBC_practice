//
//  WFViewController.m
//  UIHomeWork01
//
//  Created by Duger on 13-9-10.
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
    self.view.backgroundColor = [UIColor purpleColor];
    UITextField *userName = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    userName.center = CGPointMake(160, 100);
    userName.borderStyle = UITextBorderStyleRoundedRect;
    userName.placeholder = @"输入用户名";
    UITextField *passWord = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    passWord.center = CGPointMake(160, 140);
    passWord.borderStyle = UITextBorderStyleRoundedRect;
    passWord.placeholder = @"密码";
    passWord.secureTextEntry = YES;
    
//    userName setFont:[UIFont ]
    
    
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [login setFrame:CGRectMake(120, 200, 80, 20)];
    [login setBackgroundColor:[UIColor grayColor]];
    [login setTitle:@"登陆" forState:UIControlStateNormal];
    [login setTitle:@"登陆" forState:UIControlStateHighlighted];
    login.tag = 101;
    userName.tag = 102;
    passWord.tag = 103;
    
    [self.view addSubview:login];
    [self.view addSubview:userName];
    [self.view addSubview:passWord];
    [userName release];
    [passWord release];
    
    
    
    
    
    [login addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [userName addTarget:self action:@selector(test:) forControlEvents:UIControlEventEditingDidEnd];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
   
}

-(void)test
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"登陆成功！" message:@"登陆成功！！" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"登陆失败！" message:@"登陆失败！！" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
    UITextField *useName = (UITextField *)[self.view viewWithTag:102];
    UITextField *password  = (UITextField *)[self.view viewWithTag:103];
    [password resignFirstResponder];
    [useName resignFirstResponder];
    if ([useName.text isEqual: @"wang"]&& [password.text isEqualToString:@"123"]) {
        [alert1 show];
    }else{
        [alert2 show];
    }
    [alert1 release];
    [alert2 release];
    
}


- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    UITextField *useName = (UITextField *)[self.view viewWithTag:102];
    UITextField *password  = (UITextField *)[self.view viewWithTag:103];
    [password resignFirstResponder];
    [useName resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
