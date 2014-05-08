//
//  RegisterViewController.m
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "RegisterViewController.h"
#import "XMPPManager.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClcikBackButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didClickRegisterButton:(UIButton *)sender {
    if (self.userNameTextField.text != nil && self.passwordTextField.text != nil && self.serverTextField.text != nil) {
        [[NSUserDefaults standardUserDefaults]setObject:self.userNameTextField.text forKey:@"kUserName"];
        [[NSUserDefaults standardUserDefaults]setObject:self.passwordTextField.text forKey:@"kPassword"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"kRegister"];
        //同步
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[XMPPManager defaultManager] connectToServer];
    }
    
    
    
}
@end
