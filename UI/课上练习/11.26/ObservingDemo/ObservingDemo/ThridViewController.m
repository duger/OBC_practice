//
//  ThridViewController.m
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ThridViewController.h"

@interface ThridViewController ()

@end

@implementation ThridViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"第三个";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    //观察通知中心是否用对应的通知发布
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeColor:) name:@"newThemeColor!" object:nil];//object 谁拿走的通知
    
}

-(void)changeThemeColor:(id)sender
{
    self.navigationController.navigationBar.barTintColor = [[sender userInfo] objectForKey:@"newThemeColor!" ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
