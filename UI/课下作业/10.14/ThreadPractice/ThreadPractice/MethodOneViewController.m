//
//  MethodOneViewController.m
//  ThreadPractice
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MethodOneViewController.h"

@interface MethodOneViewController ()

//线程方法
-(void)_threadMethod:(id)sender;
//主线程刷新方法
-(void)_refreshOnMainThread;
@end

@implementation MethodOneViewController
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickButton:(UIButton *)sender {
    [NSThread detachNewThreadSelector:@selector(_threadMethod:) toTarget:self withObject:nil];
}

#pragma mark - private method
-(void)_threadMethod:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] run];
    
}

-(void)_timerMethod
{
    [NSThread sleepForTimeInterval:2.0f];
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
    
}


-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date]description];
    text = [text stringByAppendingFormat:@"\n%@",date];
    self.textView.text = text;
}



- (void)dealloc {
    [_textView release];
    [super dealloc];
}



@end
