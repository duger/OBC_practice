//
//  SaveEventFilesManager.m
//  ToDoListManger
//
//  Created by Duger on 13-10-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SaveEventFilesManager.h"

@implementation SaveEventFilesManager
static SaveEventFilesManager *s_SaveEventFilesManager = nil;
+(SaveEventFilesManager *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_SaveEventFilesManager == nil) {
            s_SaveEventFilesManager = [[SaveEventFilesManager alloc]init];
        }
    });
    return s_SaveEventFilesManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        //初始化事件数组
        self.events = [[NSMutableArray alloc]init];
    }
    return self;
}



@end
