//
//  EventManager.m
//  ToDoListManger
//
//  Created by Duger on 13-10-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "EventManager.h"
#import "NSDate+Addtion.h"

@implementation EventManager


- (id)init
{
    self = [super init];
    if (self) {
        //初始化事件数组
        self.events = [[NSMutableArray alloc]init];
        
        //获取当前时间
        self.eventDate = [NSDate currentDate];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        self.eventCurrentDate = [formatter stringFromDate:self.eventDate];
        self.eventRemindDate = [formatter stringFromDate:self.eventDate];
        [formatter release];
    }
    return self;
}


@end
