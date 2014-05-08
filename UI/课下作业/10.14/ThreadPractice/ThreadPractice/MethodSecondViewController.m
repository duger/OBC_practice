//
//  MethodSecondViewController.m
//  ThreadPractice
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MethodSecondViewController.h"

@interface MethodSecondViewController ()
//线程方法
-(void)_threadMethod:(id)sender;
-(void)_timerMethod;
//主线程刷新方法
-(void)_refreshOnMainThread;
@end

@implementation MethodSecondViewController
{
    NSThread *thread;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textView release];
    [super dealloc];
}
- (IBAction)didClickButton:(id)sender {
    //    [self _refreshOnMainThread];
    [self performSelectorInBackground:@selector(_threadMethod:) withObject:nil];
}


#pragma mark -private method
//线程方法
-(void)_threadMethod:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] run];
}

-(void)_timerMethod
{
    if ([[NSThread currentThread] isCancelled]) {
        [NSThread exit];
    }
    [NSThread sleepForTimeInterval:3.0f];
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
}

//主线程刷新方法
-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date] description];
    text = [text stringByAppendingFormat:@"\n%@",date];
    self.textView.text = text;
}


@end
