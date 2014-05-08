//
//  EditViewController.m
//  ToDoListManger
//
//  Created by Duger on 13-10-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "EditViewController.h"
#import "EditManager.h"
#import "CharacterViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

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
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickSaveItem:)];
    self.navigationItem.rightBarButtonItem = saveItem;
    
    EditManager *editManagment = [[EditManager alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    editManagment.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    editManagment.delegate = self;
    [self.view addSubview:editManagment];
    [editManagment release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickSaveItem:(UIBarButtonItem *)item
{
    
}

#pragma mark - EditManager Delegate
-(void)didClickContentType
{
    CharacterViewController *CharacterVC = [[CharacterViewController alloc]init];
    CharacterVC.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.navigationController pushViewController:CharacterVC animated:YES];
    [CharacterVC release];
}



@end
