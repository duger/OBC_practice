//
//  BageRootViewController.h
//  SocketDemo
//
//  Created by Duger on 13-12-29.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BageRootViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *didClickLineButton;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
- (IBAction)didClickButton:(UIButton *)sender;

@end
