//
//  DetailViewController.m
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "DetailViewController.h"
#import "FirstViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
	// Do any additional setup after loading the view.
    self.textField = [[[UITextField alloc]initWithFrame:CGRectMake(20, 100, 280, 40)]autorelease];
    self.textField.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.textField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyBoard:) name:UIKeyboardWillHideNotification object:nil];
    //观察键盘隐藏通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self.textField action:@selector(resignFirstResponder)];
    [self.view addGestureRecognizer:tapGes];
    [tapGes release];
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    NSArray *viewCs = self.navigationController.viewControllers;
    NSLog(@"%@",[viewCs description]);
    FirstViewController *firstVC = [viewCs objectAtIndex:0];
    [firstVC setValue:@"lanou10" forKeyPath:@"textLabel.text"];
//    [firstVC setValue:@"哈哈" forUndefinedKey:@"迪IDI"];
    
    
    NSLog(@"%@",[firstVC valueForKey:@"textLabel.text"]);
    
}




-(void)hideKeyBoard:(id)sender
{
    NSLog(@"%s      %@",__FUNCTION__,[sender userInfo]);
}

-(void)keyboardWillShow:(id)sender
{
    NSLog(@"%s    %@",__FUNCTION__,[sender userInfo]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    self.textField = nil;
    [super dealloc];
}

@end
