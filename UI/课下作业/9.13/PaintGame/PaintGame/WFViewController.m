//
//  WFViewController.m
//  PaintGame
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "PaintView.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PaintView *paintTable = [[PaintView alloc]initWithFrame:self.view.bounds];
    paintTable.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    paintTable.tag = 88;
    [self.view addSubview:paintTable];
    [paintTable release];
    
    UIButton *takePhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    takePhotoButton.frame = CGRectMake( 20,420 , 40, 20);
    
    [takePhotoButton setTitle:@"拍照" forState:UIControlStateNormal];
    
    [takePhotoButton addTarget:self action:@selector(didClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:takePhotoButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickButton
{
    PaintView *paintTable = (PaintView *)[self.view viewWithTag:88];
    UIImageWriteToSavedPhotosAlbum(paintTable.myImage, nil, nil, nil);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"拍照" message:@"照片已经保存在相册中！" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
    
    
    
}

@end
