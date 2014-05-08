//
//  WFViewController.m
//  MyClock
//
//  Created by Duger on 13-9-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSInteger count;
    NSInteger pointY;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    count = 0;
    pointY = 0;
    self.resigedViewList = [[NSMutableArray alloc]init];
   

    self.ScorllView.contentSize = CGSizeMake(300,600);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.resigedViewList = nil;
    
}

- (IBAction)didClickResigtButton:(UIButton *)sender {
    
    //注册
    NSDate *currentDate = [NSDate date];
    NSDate *targetDate = self.datePicker.date;
    if ([targetDate compare:currentDate] == NSOrderedAscending) {
        return;
    }
    
    UILocalNotification *localNotification = [[[UILocalNotification alloc]init]autorelease];
    localNotification.alertBody = @"时间到了！！！";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    if (count > 0) {
        localNotification.applicationIconBadgeNumber = count;
    }
    
    localNotification.fireDate = targetDate;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [localNotification release];
    [self addRegistedTextField];
       
    
}


-(void)addRegistedTextField
{

    UIView *view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor purpleColor];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(4, 2, 200, 40)];
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.tag = 100 + pointY;
    textField.text = self.TextField.text;
//    [textField.text copy:self.TextField.text];
    self.TextField.text = @"";
    textField.userInteractionEnabled = NO;
    
    [deleteButton setFrame:CGRectMake(220, 2, 60, 40)];
    
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    
    [deleteButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:textField];
    [view addSubview:deleteButton];
    
    
    [self.resigedViewList addObject:view];
    NSLog(@"Piont%d",pointY);
    NSLog(@"数组个数：%d",[self.resigedViewList count]);
//    [self.ScorllView addSubview:view];
    [textField release];
    [view release];
    
    [self setPlace];
}

-(void)setPlace
{
    for (int i = 0; i < [self.resigedViewList count]; i++) {
        UIView *view = [self.resigedViewList objectAtIndex:i];
        [view setFrame:CGRectMake(0, i * 50 , 300, 45)];
        [self.ScorllView addSubview:view];

    }
}

-(void)didClickButton:(UIButton *)button
{
    NSLog(@"wangwang");
    [button.superview removeFromSuperview];
    [self.resigedViewList removeObjectAtIndex:[self.resigedViewList indexOfObject:button.superview]];
    [self setPlace];
}



- (IBAction)didClickDatePicker:(UIDatePicker *)sender {

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    self.TextField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:sender.date]];
    [formatter release];
}



- (void)dealloc {
    self.TextField = nil;
    self.ScorllView = nil;
    self.datePicker = nil;
    self.resigedViewList = nil;
    [super dealloc];
}
@end
