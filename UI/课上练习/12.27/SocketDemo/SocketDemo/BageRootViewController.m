//
//  BageRootViewController.m
//  SocketDemo
//
//  Created by Duger on 13-12-29.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "BageRootViewController.h"
#import "SocketManager.h"

@interface BageRootViewController ()

@end

@implementation BageRootViewController

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

- (IBAction)didClickButton:(UIButton *)sender {
    
    if ([[SocketManager defaultManager]isConnected]) {
        NSLog(@"已经连接");
        [[SocketManager defaultManager]sendMessage:@"wangwangwangwang"];
    }else
        NSLog(@"没有连接");

}
@end
