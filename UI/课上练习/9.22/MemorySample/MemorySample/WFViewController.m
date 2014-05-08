//
//  WFViewController.m
//  MemorySample
//
//  Created by Duger on 13-9-22.
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
    //1.需要进行内存管理的，一定是对象
    //2.OC语言中进行内存管理，在iOS平台使用的是引用计数机制
    //3.引用计数机制包含两种模式，一个是ARC，一个是非ARC
    //4.ARC == Automatic  Referencing（引用） Counting
    
    
    redView = [[UIView alloc]init];  //这俩儿是一对儿
    
    //二。非实例  局部对象
    //普通对象
    UIView *blueView = [[UIView alloc]init];
    
    //方法的最后一定有
    [blueView release];
    
    
    //特殊的
    //1
    NSString *str = @"hahah";
    //不用写
    
    //2
    NSString *str2 = [[NSString alloc]initWithString:@"hahah"];
    //可以
    
    //3
    NSString *str3 = [[NSString alloc]initWithFormat:@"%@",@"hahah"];
    //一定要release
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [redView release]; //这俩儿是一对儿
}


-(id)init
{
    if (self) {
        redView = [[UIView alloc]init];//必须release
        string = @"hahahah";//不用release
        string = [[NSString alloc]initWithString:@"hahahh"];  //可以release
        string = [[NSString alloc]initWithFormat:@"%@",@"hahah"];  //必须release
    }
    return self;
}

- (void)dealloc
{
    [redView release];
    
    [super dealloc];
}

@end
