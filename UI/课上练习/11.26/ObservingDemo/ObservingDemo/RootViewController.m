//
//  RootViewController.m
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"    
#import "ThridViewController.h" 
#import "ForthViewController.h"

@interface RootViewController ()

-(UINavigationController *)_createNavigationControllerWithRootViewController:(UIViewController *)rootVC;

@end

@implementation RootViewController

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
    FirstViewController *firstVC = [[FirstViewController alloc]init];

    SecondViewController *secondVC = [[SecondViewController alloc]init];
    ThridViewController *thridVC = [[ThridViewController alloc]init];
    ForthViewController *forthVC = [[ForthViewController alloc]init];
    NSArray *nivaArr = [[NSArray alloc]initWithObjects:
                      [self _createNavigationControllerWithRootViewController:firstVC],
                      [self _createNavigationControllerWithRootViewController: secondVC],
                      [self _createNavigationControllerWithRootViewController: thridVC],
                      [self _createNavigationControllerWithRootViewController: forthVC], nil];
    self.viewControllers = nivaArr;
    
    [nivaArr release];
    [firstVC release];
    [secondVC release];
    [thridVC release];
    [forthVC release];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
-(UINavigationController *)_createNavigationControllerWithRootViewController:(UIViewController *)rootVC
{
    UINavigationController *naviVC = [[UINavigationController alloc]initWithRootViewController:rootVC];
    naviVC.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    if (![rootVC isKindOfClass:[ForthViewController class]]) {
//        [[NSNotificationCenter defaultCenter]addObserver:rootVC selector:@selector() name:@"newThemeColor!" object:rootVC];
    }
    
    return [naviVC autorelease];
}

-(void)changeThemeColor:(id)sender
{
    
    NSLog(@"%@",[sender userInfo]);
}


@end
