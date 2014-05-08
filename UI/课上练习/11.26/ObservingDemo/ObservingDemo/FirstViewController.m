//
//  FirstViewController.m
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"首页";
        self.textLabel = [[[UILabel alloc]initWithFrame:CGRectMake(60, 100, 200, 40)]autorelease];
        self.textLabel.backgroundColor = [UIColor orangeColor];

        [self.view addSubview:self.textLabel];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //观察通知中心是否用对应的通知发布
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeColor:) name:@"newThemeColor!" object:nil];//object 谁拿走的通知
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"GOGOGO!!" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 80, 40)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    
    [self addObserver:self forKeyPath:@"textLabel.text" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
}

//一旦键上的值发生改变
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"xxxx-----%@",change);
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"出错%@   %@",key,value);
}

-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"错%@",key);
    return nil;
}

-(void)didClickButton:(id)sender
{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    [detailVC release];
}

-(void)changeThemeColor:(id)sender
{
    
    NSLog(@"%@",[sender userInfo]);
}

//-(void)changeThemeColor:(id)sender
//{
//    self.navigationController.navigationBar.barTintColor = [[sender userInfo] objectForKey:@"newThemeColor!" ];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.textLabel = nil;
    [super dealloc];
}

@end
