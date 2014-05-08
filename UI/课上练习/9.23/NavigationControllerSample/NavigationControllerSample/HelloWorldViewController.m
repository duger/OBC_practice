//
//  HelloWorldViewController.m
//  NavigationControllerSample
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "HelloLanouViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Hello World";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    HelloLanouViewController *lanouVC = [[HelloLanouViewController alloc]init];
    
    lanouVC.color = self.view.backgroundColor;
    [self.navigationController pushViewController:lanouVC animated:YES];
    
    
    
    [lanouVC release];
    
}


-(void)viewWillAppear:(BOOL)animated
{
//    self.view.backgroundColor = MYARCRENDOMCOLOR;
    self.view.backgroundColor = [ColorManager defaultManager].color;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
