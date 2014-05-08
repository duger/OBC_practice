//
//  WFAppDelegate.h
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFViewController;

//UIResponder 响应者类 是UIKit框架的基类
//<>部分，只是说WFAppDelegate这个类接受了应用程序类的代理协议
@interface WFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WFViewController *viewController;

@end
