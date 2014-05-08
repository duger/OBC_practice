//
//  WFViewController.m
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

static inline NSNumber *toNSNumber(NSString *value)
{
    NSInteger integer = [value integerValue];
    NSNumber *number = [NSNumber numberWithInteger:integer];
    return number;
}

@interface WFViewController ()

@end

@implementation WFViewController
{
    Person *person;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    person = [[CoreDataManager defaultManager]createdPerson];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickAddButton:(UIButton *)sender {
}

- (IBAction)didClickSelectButton:(id)sender {
}

- (IBAction)didClickDeleteButton:(UIButton *)sender {
}

- (IBAction)didClickUpdateButton:(UIButton *)sender {
}
@end
