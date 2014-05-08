//
//  WFViewController.m
//  LightGame
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "customButton.h"
@interface WFViewController ()
{
    NSMutableArray *customButtonList;
}

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    customButtonList = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    CGFloat side = 50.0f;
    CGFloat margin = (320 - 50.0f * 5) / 6;
    for (NSInteger y = 1; y <= 5; y++) {
        CGFloat pointY = 50 + side / 2 + margin * y  + side * (y - 1);
        for (NSInteger x = 1; x <= 5; x++) {
            CGFloat pointX = side / 2 + margin * x + side * (x - 1);
            customButton *customBtn = [[customButton alloc]initWithFrame:CGRectMake(0, 0, side, side)];
            customBtn.center = CGPointMake(pointX, pointY);
            customBtn.x = x;
            customBtn.y = y;
            customBtn.tag = x + y * 1000;
            [self.view addSubview:customBtn];
            [customButtonList addObject:customBtn];
            [customBtn release];
            
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [customButtonList release];
}

- (void)dealloc
{
    [customButtonList release];
    [super dealloc];
}

@end
