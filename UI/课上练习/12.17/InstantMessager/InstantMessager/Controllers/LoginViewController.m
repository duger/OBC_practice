//
//  LoginViewController.m
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "LoginViewController.h"
#import "XMPPManager.h"
#import "RegisterViewController.h"
#import "BuddyListViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //将登陆界面作为观察者去观察通知中心是否有指定的名称为kAuthenticateSucceed的通知，一点捕获，执行：presentBuddyListAction
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(presentBuddyListAction:) name:kAuthenticateSucceed object:nil];
}



-(void)presentBuddyListAction:(id)sender
{
    BuddyListViewController *buddyListVC = [[BuddyListViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *naviC = [[UINavigationController alloc]initWithRootViewController:buddyListVC];
    buddyListVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:naviC animated:YES completion:nil];
    [[[UIApplication sharedApplication]keyWindow]setRootViewController:naviC];
}



- (IBAction)didClickLogin:(UIButton *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (self.userTextField.text != nil && self.passwordTextField.text != nil ) {
        [[NSUserDefaults standardUserDefaults]setObject:self.userTextField.text forKey:@"kUserName"];
        [[NSUserDefaults standardUserDefaults]setObject:self.passwordTextField.text forKey:@"kPassword"];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"kRegister"];
        //同步
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[XMPPManager defaultManager] connectToServer];
    }

}

- (IBAction)didClickRigisterButton:(UIButton *)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
//    registerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    registerVC.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self presentViewController:registerVC animated:YES completion:nil];
    
}
@end
