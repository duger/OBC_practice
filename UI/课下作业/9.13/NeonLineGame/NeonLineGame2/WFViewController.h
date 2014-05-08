//
//  WFViewController.h
//  NeonLineGame2
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController
{
    NSTimer *timer1;
    NSTimer *timer2;
}
@property (retain, nonatomic) IBOutlet UISwitch *Switch;
- (IBAction)didClickButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIView *neonView;
@property (retain, nonatomic) IBOutlet UIView *neonView2;

@end
