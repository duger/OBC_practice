//
//  WFViewController.m
//  GameSampleThird
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "myButton.h"
#define XLINE 5
#define YLINE 5

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSMutableArray *myButtonList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myButtonList = [[NSMutableArray alloc]init];
    //myButton 边长
    CGFloat side = 50.0f;
    CGFloat margin = (320.0 - 50.0 * 5) / 6.0f;
    
    for (NSInteger y = 1 ; y <= YLINE; y++) {
        CGFloat pointY = 50.0f + margin * y + side *(y - 1) + side / 2;
        for (NSInteger x = 1; x <= XLINE; x++) {
            CGFloat pointX = margin * x + side *(x - 1) + side / 2;
            //实例化button
            myButton *button = [[myButton alloc]initWithFrame:CGRectMake(0, 0, side, side)];
            //button 位置
            button.center = CGPointMake(pointX, pointY);
            button.x = x;
            button.y = y;
            button.tag = x + y * 1000;
            button.delegate = self;
            [myButtonList addObject:button];
            
            [self.view addSubview:button];
            [button release];
        
        }
    }
    
    
    //制作标题  用textfile
    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //标题栏设置 不可点击 背景颜色 字体内容 字体颜色 字体居中 字体样式大小
    title.backgroundColor = [UIColor purpleColor];
    title.text = @"灯凳灯";
    title.userInteractionEnabled = NO;
    title.font = [UIFont fontWithName:@"Arial" size:30.0f];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    
    title.tag = 88;
    [self.view addSubview:title];
    [title release];
    
    //制作reset键
    UIButton *restButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    restButton.frame = CGRectMake(0, 0, 100, 40);
    restButton.center = CGPointMake(160 , 415);
    [restButton setTitle:@"重玩儿" forState:UIControlStateNormal];
    [restButton setTitle:@"重玩儿" forState:UIControlStateHighlighted];
    restButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:23.0];
    [restButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
-(void)reset
{
    for (myButton *item in myButtonList) {
        [item reset];
    }
    //重置title
    UITextField *title = (UITextField *)[self.view viewWithTag:88];
    title.text = [NSString stringWithFormat:@"0 / 25"];
}

-(void)showTheCount
{
    NSInteger count = 0;
       UITextField *title = (UITextField *)[self.view viewWithTag:88];
    for (myButton *item in myButtonList) {
        if (item.orangeButton.hidden) {
            count++;
        }
    }
    title.text = [NSString stringWithFormat:@"%d / 25",count];
}

@end
