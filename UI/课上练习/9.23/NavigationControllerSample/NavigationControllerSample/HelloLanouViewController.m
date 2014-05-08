//
//  HelloLanouViewController.m
//  NavigationControllerSample
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "HelloLanouViewController.h"

@interface HelloLanouViewController ()

@end

@implementation HelloLanouViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Hello Lanou";
        self.navigationItem.prompt = @"一个程序员的自我修养！";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    
//    self.view.backgroundColor = self.color;
    self.view.backgroundColor = [ColorManager defaultManager].color;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
