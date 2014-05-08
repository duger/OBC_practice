//
//  WFFirstViewController.m
//  ThreadPractice2
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFFirstViewController.h"

@interface WFFirstViewController ()

@end

@implementation WFFirstViewController
{
    NSThread *thread;
}

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
    //3.
    if ([[[sender titleLabel]text]isEqualToString:@"Start"]) {
        thread = [[NSThread alloc]initWithTarget:self selector:@selector(_threadMethod:) object:nil];
        //启动线程
        [thread start];
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }else
        //    {
        //        [thread cancel];
        //        [sender setTitle:@"Start" forState:UIControlStateNormal];
        //    }
        
        
        
        if ([sender.titleLabel.text isEqualToString:@"Suspend"]) {
            
            //取消线程
            [thread suspend];
            //        [thread release],thread = nil;
            [sender setTitle:@"Resume" forState:UIControlStateNormal];
            
        }else
            
            if ([sender.titleLabel.text isEqualToString:@"Resume"]) {
                
                //取消线程
                [thread resume];
                //        [thread release],thread = nil;
                [sender setTitle:@"Suspend" forState:UIControlStateNormal];
                
            }

}

-(void)_threadMethod:(id)sender
{
    CustomView *customView = (CustomView *)[self.view viewWithTag:1001];
    [customView _threadMethod:sender];
    
}

@end
