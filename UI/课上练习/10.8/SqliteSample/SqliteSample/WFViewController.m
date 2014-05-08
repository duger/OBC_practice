//
//  WFViewController.m
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"


@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickCreateTable:(UIBarButtonItem *)sender {
    NSString *tableName = @"Person";
    NSMutableDictionary *attribute = [[NSMutableDictionary alloc]init];
    
    [attribute setObject:@"text" forKey:@"pid"];
    [attribute setObject:@"text" forKey:@"pname"];
    [attribute setObject:@"text" forKey:@"page"];
    [[SqliteManager singleton]createTable:tableName attribute:attribute];
    [attribute release];
}
@end
