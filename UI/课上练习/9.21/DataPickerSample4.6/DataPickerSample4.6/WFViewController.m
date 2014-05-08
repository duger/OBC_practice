//
//  WFViewController.m
//  DataPickerSample4.6
//
//  Created by Duger on 13-9-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

-(NSString *)dateStringForIndex:(NSInteger)index;
@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //实例化分段控制视图
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"1",@"2",@"3",@"4"]];
    //设置分段视图大小
    segmentedControl.frame = CGRectMake(0, 0, 320, 40);
    //设置分段控制视图的样式
    //    segmentedControl.segmentedControlStyle
    segmentedControl.tag = 1000;
    //添加触发的事件
    [segmentedControl addTarget:self action:@selector(didClickSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    //释放segmentedControl
    [segmentedControl release];
    
    //实例化UIDatePicker的实例视图
    UIDatePicker *datePicker = nil;
    //
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,300, 320, 190)];
    //设置UIDatePicker的样式
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.tag = 1001;
    [datePicker addTarget:self action:@selector(didClickDatePicker:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    [datePicker release];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 45, 320, 250)];
    
#define kRandomFloat (arc4random() % 1000 / 1000.0f)
#define kRandomColor [UIColor colorWithRed:kRandomFloat green:kRandomFloat blue:kRandomFloat alpha:1]
    textView.backgroundColor = kRandomColor;
    textView.textColor = kRandomColor;
    textView.tag = 1002;
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:24.5f];
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
-(void)didClickSegmentedControl:(UISegmentedControl *)sender
{
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1001];
    switch (sender.selectedSegmentIndex) {
        case 0:
            datePicker.datePickerMode = UIDatePickerModeTime;
            break;
        case 1:
            datePicker.datePickerMode = UIDatePickerModeDate;
            break;
        case 2:
            datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case 3:
            datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
            break;
            
        default:
            break;
    }
}

-(void)didClickDatePicker:(UIDatePicker *)sender
{
    NSLog(@"%@",[sender.date description]);
    UITextView *textView = (UITextView *)[self.view viewWithTag:1002];
    UISegmentedControl *segmentControl = (UISegmentedControl *)[self.view viewWithTag:1000];
    textView.text = [NSString stringWithFormat:@"%@\n%@",textView.text,[self dateStringForIndex:segmentControl.selectedSegmentIndex]];
}

-(NSString *)dateStringForIndex:(NSInteger)index
{
    //实例化
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    //获取DatePicker对象
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1001];
    switch (index) {
        case 0:
        {
            [formatter setDateFormat:@"hh-mm-ss"];
            break;}
        case 1:
        {
            [formatter setDateFormat:@"yyyy-MM-dd"];
            break;}
        case 2:
        {
            [formatter setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
            break;}
        case 3:
        {
            [formatter setDateFormat:@"EEE"];
            break;}
            
        default:
            break;
    }
    return [formatter stringFromDate:datePicker.date];
}

@end
