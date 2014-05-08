//
//  WFViewController.h
//  MyClock
//
//  Created by Duger on 13-9-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *TextField;
@property (retain, nonatomic) IBOutlet UIScrollView *ScorllView;

@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

@property(retain,nonatomic) NSMutableArray *resigedViewList;
- (IBAction)didClickResigtButton:(UIButton *)sender;

- (IBAction)didClickDatePicker:(UIDatePicker *)sender;
@end
