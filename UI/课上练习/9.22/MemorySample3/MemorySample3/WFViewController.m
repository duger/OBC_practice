//
//  WFViewController.m
//  MemorySample3
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
    
    //1.字符串第一种赋值方式
    self.name = @"Duger";
    
    //2.除了字符串那种，
    NSString *tempStr = [[NSString alloc]initWithString:@"Duger"];
    self.name = tempStr;
    [tempStr release];
    
    
    
    //3.获得发送的消息 只要类型一样 
    self.redView = [self view];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.name = nil;
    self.redView = nil;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.redView = nil;
    }
    return self;
}


- (void)dealloc
{
    self.name = nil;
    self.redView = nil;
    [super dealloc];
}

@end
