//
//  LoginViewController.h
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)didClickLogin:(UIButton *)sender;
- (IBAction)didClickRigisterButton:(UIButton *)sender;

@end
