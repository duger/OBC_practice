//
//  WFViewController.m
//  NewLightGame
//
//  Created by Duger on 13-9-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "customView.h"

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSMutableArray *lightList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lightList = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    CGFloat side = 50.0f;
    CGFloat margin = (320.0f - 50.0 * 5) / 6.0f;
    
    
    for (NSInteger y = 0; y <= 4; y++) {
        CGFloat pointY = 50 + side / 2 + margin * y + side * ( y - 1);
        for (NSInteger x = 1; x <= 5; x++) {
            CGFloat pointX = side /2 + margin * x + side * (x - 1);
            customView *myView = [[customView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
            myView.center = CGPointMake(pointX, pointY);
            myView.x = x;
            myView.y = y;
            myView.tag = x + y * 1000;
            [lightList addObject:myView];
            [self.view addSubview:myView];
            [myView release];
            
        }
    }
    
    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    title.backgroundColor = [UIColor grayColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.userInteractionEnabled = NO;
    title.text = @"灯灯灯";
    title.font = [UIFont fontWithName:@"Arial" size:30.0f];
    [self.view addSubview:title];
    title.tag = 88;
    [title release];
    
    UILabel *rest = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    rest.center = CGPointMake(160, 380);
    rest.text = @"Reset";
    rest.textAlignment = NSTextAlignmentCenter;
    rest.textColor = [UIColor purpleColor];
    rest.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reset:)];
    myTap.numberOfTapsRequired = 1;
    [self.view addSubview:rest];
    [rest addGestureRecognizer:myTap];
    [myTap release];
    [rest release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [lightList release];
}

-(void)reset:(id)sender
{
    NSLog(@"reset");
    UITextField *title = (UITextField *)[self.view viewWithTag:88];
    title.text = @" 0 / 25 ";
    for (customView *item in lightList) {
        [item viewReset];
    }
    
}

-(void)showTheCount
{
    UITextField *title = (UITextField *)[self.view viewWithTag:88];
    NSInteger count = 0;
    for (customView* item in lightList) {
        if ([item isClear]) {
            count++;
        }
    }
    title.text = [NSString stringWithFormat:@"%d / 25",count];

}



@end
