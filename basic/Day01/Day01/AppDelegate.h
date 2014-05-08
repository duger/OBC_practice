//
//  AppDelegate.h
//  Day01
//
//  Created by Duger on 13-7-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    //定义一个程序显示窗口的对象
    UIWindow *window;
    
    //加入视图控制实际变量的对象
    ViewController *viewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet ViewController *viewController;

@end
