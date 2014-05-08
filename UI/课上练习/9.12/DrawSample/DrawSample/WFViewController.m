//
//  WFViewController.m
//  DrawSample
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "CustomView.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CustomView *customView = [[CustomView alloc]initWithFrame:self.view.bounds];
    customView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:customView];
    [customView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
