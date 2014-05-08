//
//  MethodFifthViewController.m
//  ThreadPractice
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MethodFifthViewController.h"

@interface MethodFifthViewController ()
-(void)_refreshOnMainThread;
-(void)_threadMethod:(id)sender;
@end

@implementation MethodFifthViewController
{
    NSThread *thread;
    dispatch_queue_t queue;
    dispatch_source_t source_queue;
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
- (IBAction)didClickButton:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Start"]) {
        queue = dispatch_queue_create("gaofushuai",NULL);
//        source_queue = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//        dispatch_source_set_timer(source_queue, dispatch_time(0, 0), 1 * NSEC_PER_SEC, 0);
//        dispatch_source_set_event_handler(source_queue, ^{
//            [self _timerMethod];
//        });
//        dispatch_resume(queue);

        dispatch_async(queue, ^{
            [NSThread sleepForTimeInterval:5.0f];
        });
        
        dispatch_async(queue, ^{
            [self _threadMethod:nil];
        });
        
        
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqual:@"Suspend"]){
        dispatch_suspend(queue);
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqual:@"Resume"]){
        dispatch_resume(queue);
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
    }

}

-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date]description];
    self.textView.text = [text stringByAppendingFormat:@"\n%@",date];
}
-(void)_threadMethod:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] run];
}

-(void)_timerMethod
{
//    [NSThread sleepForTimeInterval:1.0f];
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
}
@end
