//
//  WFSecondViewController.m
//  ThreadPractice2
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFSecondViewController.h"

@interface WFSecondViewController ()

@end

@implementation WFSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 320, 560)];
    customView.backgroundColor = [UIColor purpleColor];
    customView.delegate = self;
    customView.tag = 1001;
    [self.view addSubview:customView];
    [customView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickButton:(UIButton *)sender
{
    [self performSelectorInBackground:@selector(_threadMethod:) withObject:nil];

}

-(void)_threadMethod:(id)sender
{
    CustomView *customView = (CustomView *)[self.view viewWithTag:1001];
    [customView _threadMethod:sender];
    
}

@end
