//
//  WFAppDelegate.m
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFAppDelegate.h"
#import "WFViewController.h"
#import "NSArray+Addtion.h"

@implementation WFAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",[@[@1,@2,@3,@4]reverse]);
    //4.创建窗口对象
    //UIScreen屏幕类
    /* 通过一个类方法（+）获取一个屏幕类的实例对象，而且该实例对象在任何文件内或者在任何时间获取的一定是相同的对象；我们通常把这种实例对象叫做单例。
     *这种设计实例对象的方式被称为单例模式！
    */
    
    /*
     *[UIScreen mainScreen]获取单例对象，这个单例对象的属性bounds就是我们要获取的屏幕尺寸大小。
     *CGRect bounds;
     */
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //6.使窗口成为关键窗口并且可见
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    //4.1实例化根视图控制器
    self.viewController = [[[WFViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    
    //创建控制器实例对象的view属性
    [self.viewController view];
    //5、指定窗口对象的根视图控制器
    self.window.rootViewController = self.viewController;
    //6.使窗口成为关键窗口并且可见
//    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%s",__FUNCTION__);
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%s",__FUNCTION__);
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%s",__FUNCTION__);
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%s",__FUNCTION__);
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%s",__FUNCTION__);
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
