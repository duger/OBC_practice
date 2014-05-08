//
//  WFViewController.m
//  SimpleDraw_3
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "CustomButton.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CustomButton *customButton = [[CustomButton alloc]initWithFrame:self.view.bounds];
    customButton.tag = 77;
    customButton.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:customButton];
    
    //拍照键
    UIButton *takePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [takePhoto setFrame:CGRectMake(0, 0, 50, 30)];
    [takePhoto setCenter:CGPointMake(40, 415)];
    [takePhoto setTitle:@"拍照" forState:UIControlStateNormal];
    takePhoto.titleLabel.font = [UIFont fontWithName:@"Arial" size:20.0f];
    [takePhoto addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
//    [customButton addSubview:takePhoto];
    [self.view addSubview:takePhoto];
    [takePhoto release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)takePhoto
{
    CustomButton *customButton = (CustomButton *)[self.view viewWithTag:77];
    UIImageWriteToSavedPhotosAlbum(customButton.currentImage, nil, nil, nil);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"拍照" message:@"拍照成功，请到相册查看。" delegate:nil
cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
}

@end
