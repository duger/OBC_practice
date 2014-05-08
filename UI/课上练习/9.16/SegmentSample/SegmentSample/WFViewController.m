//
//  WFViewController.m
//  SegmentSample
//
//  Created by Duger on 13-9-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()
-(void)_segmentedControl:(UISegmentedControl *)sender;
@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //实例化分段视图
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"蓝色",@"红色",@"黑色",@"绿色"]];
    segmentedControl.frame = CGRectMake(0, 0, 320, 40);
    segmentedControl.tag = 77;
    
    [self.view addSubview:segmentedControl];
    [segmentedControl addTarget:self action:@selector(_segmentedControl:) forControlEvents:UIControlEventValueChanged];
//    [segmentedControl release];
    UIButton *insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setTitle:@"插入" forState:UIControlStateNormal];
    [insertButton addTarget:self action:@selector(_insertItem:) forControlEvents:UIControlEventTouchUpInside];
    insertButton.frame = CGRectMake(0, 60, 320, 40);
    [self.view addSubview:insertButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method

-(void)_insertItem:(UIButton *)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)[self.view viewWithTag:77];
    [segmentedControl insertSegmentWithTitle:@"黄色" atIndex:0 animated:YES];
}

-(void)_segmentedControl:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = [UIColor blueColor];
            
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor redColor];
            
            break;
        case 2:
            self.view.backgroundColor = [UIColor blackColor];
            
            break;
        case 3:
            self.view.backgroundColor = [UIColor greenColor];
            
            break;
        default:
            break;
    }
}

@end
