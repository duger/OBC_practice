//
//  RegisterViewController.h
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *serverTextField;

- (IBAction)didClcikBackButton:(UIButton *)sender;

- (IBAction)didClickRegisterButton:(UIButton *)sender;

@end
