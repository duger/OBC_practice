//
//  WFViewController.m
//  MemorySample2
//
//  Created by Duger on 13-9-22.
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

-(void)setname:(NSString *)_name
{
    //防止_name和name是同一个对象
    [_name retain];
    [name release];
    name = [_name copy];//除了字符串是copy  其他都是retain
    [_name release];
}
-(NSString *)name
{
    return name;
}

@end
