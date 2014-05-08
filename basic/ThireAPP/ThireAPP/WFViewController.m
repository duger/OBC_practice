//
//  WFViewController.m
//  ThireAPP
//
//  Created by Duger on 13-7-3.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textField release];
    [_lblResult release];
    [super dealloc];
}
- (IBAction)pressFind:(UIButton *)sender {
    if ([_textField.text length]==0) {
        return;
    }
    NSStringEncoding encode=CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *strURL=[[NSString stringWithFormat:@"http://api.liqwei.com/translate/?language=en|zh-CN&content=%@",_textField.text]stringByAddingPercentEscapesUsingEncoding:encode];
    NSURL *url=[NSURL URLWithString:strURL];
    
    NSError *err=nil;  
    NSString *strResult=[NSString stringWithContentsOfURL:url encoding:encode error:&err];
    if (err) {
        NSLog(@"error=%@",[err description]);
        
    }else{
        _lblResult.text =strResult;
    }
}
@end
