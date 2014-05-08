//
//  BageViewController.m
//  BlockDemo
//
//  Created by Duger on 14-1-14.
//  Copyright (c) 2014年 Duger. All rights reserved.
//

#import "BageViewController.h"

@interface BageViewController ()

@end

@implementation BageViewController
{
    int mam;
    int (^getMan)(int);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int muti = 5;
    int (^block)(int) = ^(int a){
        return a * muti;
    };
    
}




-(void)secondMethod
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
