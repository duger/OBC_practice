//
//  NSThread+Addition.m
//  ThreadPractice
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSThread+Addition.h"

@implementation NSThread (Addition)
-(void)suspend
{
    NSLock *lock = [[NSLock alloc] init];
    [lock lock];
    
//    [self _suspendHelper:lock];
    [[self threadDictionary]setObject:lock forKey:@"haha"];
    [self performSelector:@selector(_suspendHelper:) onThread:self withObject:lock waitUntilDone:NO];
}
-(void)resume
{
    NSLock *lock = [[self threadDictionary]objectForKey:@"haha"];
    //解锁
    [lock unlock];
    [[self threadDictionary] removeObjectForKey:@"haha"];
    [lock release],lock = nil;
}

-(void)_suspendHelper:(NSLock *)lock
{
    while (![lock tryLock]) {
        usleep(200);
    }
}
@end
