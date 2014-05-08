//
//  WFViewController.h
//  LocalNotificationSample
//
//  Created by Duger on 13-9-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)didRegistLoacalNotification:(UIButton *)sender;

@end
