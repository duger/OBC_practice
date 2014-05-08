//
//  UpdateViewController.m
//  SqliteSample
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UpdateViewController.h"
#import "Person.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController
{
    Person *person;
    NSMutableArray *personList;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    personList = [[NSMutableArray alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [personList addObjectsFromArray:[[SqliteManager singleton] itemListFromTable:@"Person"]];
    NSLog(@"穿过来的值 %d",[self.pId integerValue]);
    person = [personList objectAtIndex:[self.pId integerValue]];
    UITextField *pId = (UITextField *)[self.view viewWithTag:1001];
    UITextField *pName = (UITextField *)[self.view viewWithTag:1002];
    UITextField *pAge = (UITextField *)[self.view viewWithTag:1003];
    
    pId.text = person.pid;
    pName.text = person.pname;
    pAge.text = person.page;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickUpdate:(UIButton *)sender {
    UITextField *pId = (UITextField *)[self.view viewWithTag:1001];
    UITextField *pName = (UITextField *)[self.view viewWithTag:1002];
    UITextField *pAge = (UITextField *)[self.view viewWithTag:1003];
    person.pid = pId.text;
    person.pname = pName.text;
    person.page = pAge.text;
    [[SqliteManager singleton] update:person];
}

#pragma UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
