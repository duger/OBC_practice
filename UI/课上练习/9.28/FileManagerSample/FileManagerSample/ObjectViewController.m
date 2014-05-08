//
//  ObjectViewController.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ObjectViewController.h"
#import "ShiBan.h"

@interface ObjectViewController ()

@end

@implementation ObjectViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickSave:(id)sender
{
    ShiBan *stu = [[ShiBan alloc]init];
    stu.sid = @((NSInteger)[[NSDate date] timeIntervalSince1970] % 1000) ;
    
    stu.sname = @"李永";
    stu.sheadImg = [UIImage imageNamed:@"Default.png"];
    
    NSString *stuPath = [[UIImage imageAtDocumentPath] stringByAppendingFormat:@"/%@.stu",[stu.sid description]];
    
    [stu writeToFile:stuPath atomically:YES];
    
    
    
    
}

@end
