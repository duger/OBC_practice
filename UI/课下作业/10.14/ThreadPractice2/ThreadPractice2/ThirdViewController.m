//
//  ThirdViewController.m
//  ThreadPractice2
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
    [NSThread detachNewThreadSelector:@selector(_threadMethod:) toTarget:self withObject:nil];
}

-(void)_threadMethod:(id)sender
{
    CustomView *customView = (CustomView *)[self.view viewWithTag:1001];
    [customView _threadMethod:sender];
    
}

@end
