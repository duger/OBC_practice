//
//  WFViewController.h
//  MemorySample3
//
//  Created by Duger on 13-9-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController

//assign copy retain
@property (nonatomic,copy) NSString *name; //字符串都用copy
@property(nonatomic,assign) NSInteger age;

//除了字符串其他都retain

@property(nonatomic,retain) UIView *redView;



@end
