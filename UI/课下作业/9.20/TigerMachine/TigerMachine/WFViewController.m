//
//  WFViewController.m
//  TigerMachine
//
//  Created by Duger on 13-9-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSTimer *timer1,*timer2,*timer3;
    NSInteger row1,row2,row3;
    NSInteger timeCount;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timeCount = 0;
    row1 = arc4random()%10;
    row2 = arc4random()%10;
    row3 = arc4random()%10;
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, 320, 60)];
    
    [self.view addSubview:pickerView];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.tag = 1001;
    
    UIButton *starButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [starButton setTitle:@"开始" forState:UIControlStateNormal];
    starButton.frame = CGRectMake(0, 0, 80, 40);
    starButton.center = CGPointMake(160, 300);
    starButton.backgroundColor = [UIColor grayColor];
    [starButton addTarget:self action:@selector(didClickedStar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:starButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickedStar:(UIButton *)starButton
{
    
    if ([starButton.titleLabel.text isEqualToString:@"开始"]) {
        [starButton setTitle:@"结束" forState:UIControlStateNormal];
        timer1 = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(startRoll1) userInfo:nil repeats:YES];
        timer2 = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(startRoll2) userInfo:nil repeats:YES];
        timer3 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startRoll3) userInfo:nil repeats:YES];
        
        return;
    }
    [starButton setTitle:@"开始" forState:UIControlStateNormal];
    [timer1 invalidate];
    
    
//    [timer3 invalidate];
    timeCount = -5;
//    [timer2 invalidate];
//    [timer2 fire];
    
    
    
}

-(void)report
{
    if ((row1 % 10 == row2 % 10) && (row1 % 10 == row3 % 10)) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"恭喜你！获得奖金！" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"兑奖", nil];
        [alertView show];
        return;
    }
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"谢谢参与！" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"确认", nil];
    [alertView show];
    
}

-(void)startRoll1
{
    timeCount++;
    row1++;
    
    UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1001];

    [pickerView selectRow:row1 inComponent:0 animated:YES];
        
}

-(void)startRoll2
{
    if (timeCount < 0) {
        timeCount--;
    }
    
    
    
    row2++;
    
    UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1001];
    if (timeCount > 5) {
        [pickerView selectRow:row2 inComponent:1 animated:YES];
        
    }
    if (timeCount < 0) {
        [pickerView selectRow:row2 inComponent:1 animated:YES];
    }
    
    if (timeCount < -10) {
        
        [timer2 invalidate];
        timeCount = -1;
//        [timer3 invalidate];
//        [timer3 fire];
    }
    
    
}

-(void)startRoll3
{
    if (timeCount < 0) {
        timeCount--;
    }
    
    
    
    row3++;
    UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1001];
  
    if (timeCount > 10) {
        [pickerView selectRow:row3 inComponent:2 animated:YES];
    }
    if (timeCount < 0) {
        [pickerView selectRow:row3 inComponent:2 animated:YES];
    }
    
    if (timeCount < -20) {
        
        [timer3 invalidate];
        timeCount = 0;
        [self report];
    }
    
}



#pragma mark - pickerViewDataSource Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 16384;
}

#pragma mark - pickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 70.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    row += 1;
    NSMutableArray *strings = [NSMutableArray arrayWithCapacity:10];
//    [strings addObject:@"Zero"];
    [strings addObject:@"One"];
    [strings addObject:@"Two"];
    [strings addObject:@"Three"];
    [strings addObject:@"Four"];
    [strings addObject:@"Five"];
    [strings addObject:@"Six"];
    [strings addObject:@"Seven"];
    [strings addObject:@"Eight"];
    [strings addObject:@"Nine"];
    [strings addObject:@"Ten"];
    return [strings objectAtIndex:(row%10)];
    
//    return [[@(row) description]intValue]%10;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUInteger max = 16384;
    NSUInteger base10 = (max/2)-(max/2)%10;
    [pickerView selectRow:[pickerView selectedRowInComponent:0]%10+base10 inComponent:0 animated:false];
}




@end
