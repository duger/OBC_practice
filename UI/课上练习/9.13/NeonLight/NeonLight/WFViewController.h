//
//  WFViewController.h
//  NeonLight
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController
{
    NSTimer *timer;
}
- (IBAction)didClickButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIView *neonView;

@end
