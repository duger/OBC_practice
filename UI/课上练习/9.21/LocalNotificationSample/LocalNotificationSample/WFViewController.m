//
//  WFViewController.m
//  LocalNotificationSample
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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    count = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_datePicker release];
    [super dealloc];
}
- (IBAction)didRegistLoacalNotification:(UIButton *)sender {
    
    count++;
    NSDate *currentDate = [NSDate date];
    NSDate *targetDate = self.datePicker.date;
    if ([targetDate compare:currentDate]== NSOrderedAscending) {
        return;
    }
    //实例化通知对象
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    //设置提醒的文字
    localNotification.alertBody = @"哇哈哈哈哈~";
    //设置提醒声音
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    //设置提醒数字
    localNotification.applicationIconBadgeNumber = count;
    //设置提醒日期
    localNotification.fireDate = targetDate;

    
    //注册对象
    [[UIApplication sharedApplication] scheduleLocalNotification: localNotification];
    
    [localNotification release];
    
}
@end
