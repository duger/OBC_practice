//
//  EventManager.h
//  ToDoListManger
//
//  Created by Duger on 13-10-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventManager : NSObject


@property(nonatomic,copy) NSString *eventTitle;     //事件名字
@property(nonatomic,retain) NSDate *eventDate;      //事件日期
@property(nonatomic,copy) NSString *eventContents;  //时间内容
@property(nonatomic,retain) UIColor *eventContentsColor;    //内容颜色
@property(nonatomic,assign) CGFloat eventContentsSize;      //内容尺寸
@property(nonatomic,copy) NSString *eventContentsType;      //内容字体
@property(nonatomic,retain) NSString *eventRemindDate;      //提醒时间
@property(nonatomic,retain) NSString *eventCurrentDate;     //现在时间

@property(nonatomic,retain) NSMutableArray *events;


//-(NSString*)

@end
