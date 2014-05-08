//
//  MainListViewController.m
//  ToDoListManger
//
//  Created by Duger on 13-10-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MainListViewController.h"
#import "EditViewController.h"


@interface MainListViewController ()

@end

@implementation MainListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Beauideal";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];

    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickEditItem:)];
    self.navigationItem.rightBarButtonItem = editItem;
    UIBarButtonItem *newItem = [[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickNewItem:)];
    self.navigationItem.leftBarButtonItem = newItem;
    [newItem release];
    [editItem release];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)didClickNewItem:(UIBarButtonItem *)item
{
    UIBarButtonItem *baceItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = baceItem;
    [baceItem release];
    EditViewController *editVC = [[EditViewController alloc]init];
    editVC.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.navigationController pushViewController:editVC animated:YES];
    [editVC release];
}

-(void)didClickEditItem:(UIBarButtonItem *)item
{
    
}


@end
