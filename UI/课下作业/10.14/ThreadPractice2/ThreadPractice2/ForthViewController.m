//
//  ForthViewController.m
//  ThreadPractice2
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ForthViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController
{
    NSThread *thread;
    dispatch_queue_t queue;
    
}

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
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //添加事务
    dispatch_async(queue, ^{
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
    });
    //添加事务
    dispatch_async(queue, ^{
        while (1) {
            [NSThread sleepForTimeInterval:10.0f];
        }
        [[NSRunLoop currentRunLoop]run];
    });
    
    if ([sender.titleLabel.text isEqualToString:@"Start"]) {
        queue = dispatch_queue_create("gaofushuai", NULL);
//        dispatch_resume(queue);
        //添加第一个事务
        dispatch_async(queue, ^{
            [NSThread sleepForTimeInterval:10.0f];
        });
        
        dispatch_async(queue, ^{
            [self _threadMethod:nil];
        });
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqualToString:@"Suspend"]){
        dispatch_suspend(queue);
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
    }else if ([sender.titleLabel.text isEqualToString:@"Resume"]){
        dispatch_suspend(queue);
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
    }
    
}


-(void)_threadMethod:(id)sender
{
    CustomView *customView = (CustomView *)[self.view viewWithTag:1001];
    [customView _threadMethod:sender];
    
}

-(void)_timerMethod
{
    CustomView *customView = (CustomView *)[self.view viewWithTag:1001];
    [customView _timerMethod];
}

@end
