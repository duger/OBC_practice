//
//  NSThread+Additons.m
//  ThreadSample
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSThread+Additons.h"

@implementation NSThread (Additons)

-(void)_suspendHelper:(NSLock *)lock
{   
    while (![lock tryLock]) {
        usleep(200);
    }
}
//暂停进程
-(void)suspend
{   //线程锁
    NSLock *lock = [[NSLock alloc] init];
    //获取锁的状态
    [lock lock];
    
    //
//    [self _suspendHelper:lock];
    [[self threadDictionary] setObject:lock forKey:@"hah"];
    [self performSelector:@selector(_suspendHelper:) onThread:self withObject:lock waitUntilDone:NO];
}
//恢复进程
-(void)resume
{
    //获取已经锁上的对象
    NSLock *lock = [[self threadDictionary]objectForKey:@"hah"];
    //解锁
    [lock unlock];
    [[self threadDictionary] removeObjectForKey:@"hah"];
    [lock release],lock = nil;
}
@end
