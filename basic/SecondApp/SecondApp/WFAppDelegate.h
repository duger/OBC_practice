//
//  WFAppDelegate.h
//  SecondApp
//
//  Created by Duger on 13-7-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFViewController;

@interface WFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WFViewController *viewController;

@end