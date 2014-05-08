//
//  ForthViewController.m
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ForthViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"第四个";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height /2)];
    [button setFrame:CGRectMake(0, 0, 80, 40)];
    [button setCenter:self.view.center];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickButton:(UIButton *)sender
{
    UIColor *themeColor = [UIColor cyanColor];
    //发布通知到通知中心
    [[NSNotificationCenter defaultCenter]postNotificationName:@"newThemeColor!" object:nil userInfo:@{@"themeColor": themeColor}];
}

@end
