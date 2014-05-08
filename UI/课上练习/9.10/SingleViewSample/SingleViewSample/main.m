//
//  main.m
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WFAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        //1.创建应用程序对象                 UIApplication
        //2.指定应用程序对象的代理对象（委托）  WFAppDelegate
        //3.开启事件循环                     NSRunLoop
        //因为WFAppDelegate这个类在程序内，我们指定他接受并实现了应用程序类的委托（代理），
        //所以可以将WFAppDelegate这个类的实例对象作为应用程序对象的代理对象。
        //
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WFAppDelegate class]));
    }
}
