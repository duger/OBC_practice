//
//  MethodThirdViewController.m
//  ThreadPractice
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MethodThirdViewController.h"

@interface MethodThirdViewController ()

-(void)_threadMethod:(id)sender;
-(void)_refreshOnMainThread;

@end

@implementation MethodThirdViewController{
   
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
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    [textView setFont:[UIFont fontWithName:@"Arial" size:32]];
    //    [textView.inputAccessoryView setFrame:CGRectMake(0, 0, 320, 40)];
    UIToolbar *topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(exitEditMode)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * btnSpace2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray *buttons = @[btnSpace,btnSpace2,doneButton];
    [doneButton release];
    [topView setItems:buttons animated:YES];
    [textView setInputAccessoryView:topView];
    self.view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)exitEditMode
{
//    [textView resignFirstResponder];
}
- (void)dealloc {
    [_textView release];
    [super dealloc];
}
- (IBAction)didClickButton:(UIButton *)sender {
    if ([[[sender titleLabel]text]isEqualToString:@"Start"]) {
        thread = [[NSThread alloc]initWithTarget:self selector:@selector(_threadMethod:) object:nil];
        [thread start];
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
    }else
//{
//        [thread cancel];
//        [sender setTitle:@"Start" forState:UIControlStateNormal];
//    }
    
    if ([sender.titleLabel.text isEqualToString:@"Suspend"]) {
        [thread suspend];

        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        
    }else if([sender.titleLabel.text isEqualToString:@"Resume"]){
        [thread resume];

        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
    }
    
    
}

-(void)_threadMethod:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]run];
}

-(void)_timerMethod
{
    if ([[NSThread currentThread] isCancelled]) {
        [NSThread exit];
    }
    [NSThread sleepForTimeInterval:1.0f];
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
}

-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date]description];
    text = [text stringByAppendingFormat:@"\n%@",date];
    self.textView.text = text;
}

@end
