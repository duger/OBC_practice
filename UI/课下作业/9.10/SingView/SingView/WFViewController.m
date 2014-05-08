//
//  WFViewController.m
//  SingView
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "CustomButton.h"

#define ROW_COUNT 5
#define COLUME_COUNT 5

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSMutableArray *cunstomButtonList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //实例化按钮数组 
    cunstomButtonList = [[NSMutableArray alloc]init];
    
    
    CGFloat margin = 0.0f;
    CGFloat size = 50;
    
    //计算小格子宽度
    margin = (320.0 - 50.0 * 5) / 6.0;
    for (int x = 0; x < ROW_COUNT; x++) {
        
        CGFloat yFloat = x * size + size /2.0 + (x + 1) * margin + 60.0;
        for (int y = 0; y < COLUME_COUNT; y++) {
            CGRect rect = CGRectMake(0, 0, size, size);
            CGPoint point = CGPointMake(y * size + size /2.0 + (y + 1) * margin, yFloat);
            CustomButton *customBtn = [[CustomButton alloc]initWithFrame:rect];
            customBtn.center = point;
            customBtn.delegate = self;
            customBtn.x = x;
            customBtn.y = y;
            customBtn.tag = x * 10000 + y + 1;
            [self.view addSubview:customBtn];
            [cunstomButtonList addObject:customBtn];
            [customBtn release];
        }
    }
    
    
    UITextField *titleField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
//    titleField.enabled = NO;
    titleField.tag = 999;
    //是否接受用户点击事件
    titleField.userInteractionEnabled = NO;
    titleField.textAlignment = NSTextAlignmentCenter;
    titleField.font = [UIFont fontWithName:@"Chalkboard SE" size:30.0f];
    titleField.textColor = [UIColor whiteColor];
    titleField.backgroundColor = [UIColor blueColor];
    titleField.text = @"test";
    
    [self.view addSubview:titleField];
    [titleField release];
   
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resetButton setFrame:CGRectMake(0, 0, 60, 30)];
    [resetButton setCenter:CGPointMake(160, 410)];
    
    resetButton.titleLabel.textColor = [UIColor blackColor];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    
    [self.view addSubview:resetButton];
    
    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [cunstomButtonList release];
}

- (void)dealloc
{
    [cunstomButtonList release];
    [super dealloc];
}

#pragma mark - private methods
-(void)reset
{
    for (CustomButton *item in cunstomButtonList) {
        [item reset];
    }
    
    UITextField *titleField = (UITextField *)[self.view viewWithTag:999];
    titleField.text = @"0 / 25";
}

#pragma mark - private methods
-(void)showTheLastCount
{
    UITextField *titleField = (UITextField *)[self.view viewWithTag:999];
    NSInteger count  = 0;
    for (CustomButton *item in cunstomButtonList) {
        if ([item isOpened]) {
            count++;
        }
    }
    
    titleField.text = [NSString stringWithFormat:@"%d / 25",count];
}




@end
