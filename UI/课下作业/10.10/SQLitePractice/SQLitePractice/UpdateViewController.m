//
//  UpdateViewController.m
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "UpdateViewController.h"
#import "Person.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

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

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.pId.text = self.person.pId;
    self.pName.text = self.person.pName;
    self.pAge.text = self.person.pAge;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_pId release];
    [_pName release];
    [_pAge release];
    [super dealloc];
}
- (IBAction)didClickUpdate:(UIButton *)sender {
    self.person.pId = self.pId.text;
    self.person.pName = self.pName.text;
    self.person.pAge = self.pAge.text;
    [[SQLiteManager defaultManager]updateItem:self.person];
}

#pragma  mark - TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
