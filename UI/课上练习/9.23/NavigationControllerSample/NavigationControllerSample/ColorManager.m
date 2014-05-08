//
//  ColorManager.m
//  NavigationControllerSample
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ColorManager.h"

@implementation ColorManager

static ColorManager *s_ColorManager = nil;

+(ColorManager *)defaultManager{
    
    //加锁  给类加锁，只执行一个进程
 /*   @synchronized(self)
    {
        if (s_ColorManager == nil) {
            s_ColorManager = [[self alloc] init];
            
        }
    }
  */  
    
    //执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_ColorManager == nil) {
            s_ColorManager = [[self alloc] init];
            
        }
    });
    
    return s_ColorManager;
    
   
}
@end
