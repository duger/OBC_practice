//
//  NSThread+Additons.h
//  ThreadSample
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (Additons)
//暂停进程
-(void)suspend;
//恢复进程
-(void)resume;
@end
