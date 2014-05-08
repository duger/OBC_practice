//
//  SocketManager.h
//  SocketDemo
//
//  Created by Duger on 13-12-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@interface SocketManager : NSObject<GCDAsyncSocketDelegate>


+(SocketManager *)defaultManager;

@property(strong, nonatomic) NSString *hostAddress;

@property(assign, nonatomic) NSInteger hostPort;


//建立连接
-(NSError *)setupConnection;
//判断是否是连接状态
-(BOOL)isConnected;
//取得连接
-(void)getConnection;

//发送消息
-(void)sendMessage:(NSString *)str;
@end
