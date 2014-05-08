//
//  XMPPManager.h
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"
#import "MessageItem.h"


@class XMPPManager;
@class BuddyItem;

@protocol XMPPManagerDelegate <NSObject>
@optional
//接收到好友状态协议方法
-(void)xmppManager:(XMPPManager *)manager didReceiveNewPresenceWithBuddyItem:(BuddyItem *)item;
//接收到好友信息的方法
-(void)xmppManager:(XMPPManager *)manager didReceiveNewMessage:(MessageItem *)message;


@end


@interface XMPPManager : NSObject<XMPPStreamDelegate,XMPPRosterDelegate>


@property(strong , nonatomic) XMPPStream *xmppStream;//xmpp基础服务类
@property(strong , nonatomic) XMPPRoster *xmppRoster;//好友列表
@property(weak, nonatomic) id<XMPPManagerDelegate>delegate;


+(id)defaultManager;//单例

-(BOOL)connectToServer;//实例方法,连接服务器

-(BOOL)disconnect;//实例方法，断开服务器


@end
