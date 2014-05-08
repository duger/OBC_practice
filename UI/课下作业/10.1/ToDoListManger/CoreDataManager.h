//
//  CoreDataManager.h
//  ToDoListManger
//
//  Created by Duger on 13-10-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataManager : NSObject
+(CoreDataManager *)defaultManager;

//反序列化
-(UIColor *)unarchiveUIColor:(NSData *)colorData;
//序列化颜色
-(NSData *)archiveUIColor:(UIColor *)color;

//创建事件



@end
