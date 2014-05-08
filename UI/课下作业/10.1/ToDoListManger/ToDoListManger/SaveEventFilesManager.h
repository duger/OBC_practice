//
//  SaveEventFilesManager.h
//  ToDoListManger
//
//  Created by Duger on 13-10-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveEventFilesManager : NSObject
+(SaveEventFilesManager *)instance;

@property(nonatomic,retain) NSMutableArray *events;
@end
