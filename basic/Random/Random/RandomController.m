//
//  RandomController.m
//  Random
//
//  Created by Duger on 13-5-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "RandomController.h"

@implementation RandomController

- (IBAction)generate:(id)sender
{
  // 产生1到100间的整数
    int generated;
    generated = (int)(random() % 100) + 1;
    NSLog(@"generated = %d", generated);
    
    //请求文本框改变现实内容
    [textField setIntValue:generated];

}

- (IBAction)seed:(id)sender
{
  //产生与时间相关的随机数
    srandom((unsigned)time(NULL));
    [textField setStringValue:@"Generator seeded"];

}

-(void)awakeFromNib
{
    //产生当前时间日期  
    NSDate *now;
    now = [NSDate date];
    [textField setObjectValue:now];

}

@end
