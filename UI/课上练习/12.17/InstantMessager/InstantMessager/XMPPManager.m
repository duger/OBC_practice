//
//  XMPPManager.m
//  InstantMessager
//
//  Created by Duger on 13-12-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "XMPPManager.h"
#import "BuddyItem.h"

#define kJID @"wangfu"
#define kPassword @"1234"
#define kServerIP @"124.205.147.26"
#define kHostName @"lanouserver"

@interface XMPPManager ()

-(void)_setup;//私有方法，实例化xmppStream,和xmppRoster
-(void)_userOnlineStatus;//私有方法，当前用户的在线状态
-(void)_userOfflineStatus;//私有方法，用户离线


@end

@implementation XMPPManager

static XMPPManager *s_xmppManager = nil;
+(id)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_xmppManager = [[XMPPManager alloc]init];
    });
    return s_xmppManager;
}
                         
                         
                         

#pragma mark - Public Methods -
//实例方法,连接服务器
-(BOOL)connectToServer
{
    [self _setup];//连接服务器之前，先保证—_xmppSteam已经被实例化

    NSString *userJID = kJID;
    NSString *userPassword = kPassword;
    NSString *serverIP = kServerIP;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isRegister = [userDefaults boolForKey:@"kRegister"];
    if (isRegister) {
        userJID = [userDefaults objectForKey:@"kUserName"];
        userPassword = [userDefaults objectForKey:@"kPassword"];

    }
    userJID = [userDefaults objectForKey:@"kUserName"];
    userPassword = [userDefaults objectForKey:@"kPassword"];
    
    //判断服务器是否已经连接，若连接，就不用再连接了
    if (![self.xmppStream isDisconnected]) {
        return YES;
    }
    //判断用户没有输入用户会话标识，或者密码，则无法连接服务器
    if (userJID == nil || userPassword == nil) {
        return NO;
    }
    
    XMPPJID *jid = [XMPPJID jidWithUser:userJID domain:kHostName resource:@"motherFucker"];
    //设置用户会话标识
    [self.xmppStream setMyJID:jid];
    [self.xmppStream setHostName:serverIP];
    
    NSError *error = nil;
    
    //通过以上设置连接到指定ip地址的服务器
    if (![self.xmppStream connectWithTimeout:10.0 error:&error]) {
        NSLog(@"连接服务器失败：%@",error.description);
        return NO;
    }
    return YES;
    
}
//实例方法，断开服务器
-(BOOL)disconnect;
{
    //更改用户当前的状态为离线
    [self _userOfflineStatus];
    [self.xmppStream disconnect];
    return YES;
    
}



#pragma mark - Private Methods -
//私有方法，实例化xmppStream,和xmppRoster
-(void)_setup;
{
    if (self.xmppStream == nil) {
        self.xmppStream = [[XMPPStream alloc]init];
        [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    
    if (self.xmppRoster == nil) {
        XMPPRosterCoreDataStorage *rosterStorage = [[XMPPRosterCoreDataStorage alloc]init];
        self.xmppRoster = [[XMPPRoster alloc]initWithRosterStorage:rosterStorage dispatchQueue:dispatch_get_main_queue()];
        
        [self.xmppRoster activate:self.xmppStream];
        [self.xmppRoster addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    
    
    
    
}
//私有方法，当前用户的在线状态
-(void)_userOnlineStatus;
{
    //用户状态
    XMPPPresence *onlinePresence = [XMPPPresence presenceWithType:@"avaliable"];
    [self.xmppStream sendElement:onlinePresence];
}
//私有方法，用户离线
-(void)_userOfflineStatus;
{
    XMPPPresence *offLinePresence = [XMPPPresence presenceWithType:@"Unavaliable"];
    [self.xmppStream sendElement:offLinePresence];
}

#pragma mark - XMPPStream Delegate Methods-
//服务器连接成功代理方法
-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isRegister = [userDefaults boolForKey:@"kRegister"];
    NSString *password = [userDefaults objectForKey:@"kPassword"];
    if (isRegister) {
        [self.xmppStream registerWithPassword:password error:nil];
        [userDefaults setBool:NO forKey:@"kRegister"];

    }else
    //根据当前用户提供的密码与服务器做验证
    [self.xmppStream authenticateWithPassword:kPassword error:nil];
    
}


//服务器连接失败的代理方法
-(void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"%@",[error description]);
}
//服务器验证成功的代理方法
-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    //更改用户在线状态为在线
    [self _userOnlineStatus];
    //一旦登陆成功，想通知中心发送一个指定的通知，等待loginVIewController实例对象捕获
    [[NSNotificationCenter defaultCenter]postNotificationName:kAuthenticateSucceed object:nil];
}

//服务器验证失败的回调方法
-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    NSLog(@"%@",[error description]);
}

-(void)xmppStreamDidRegister:(XMPPStream *)sender
{
    NSLog(@"注册成功");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *password = [userDefaults objectForKey:@"kPassword"];
    //使用刚刚注册成功的用户登录
    [self.xmppStream authenticateWithPassword:password error:nil];
}

-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error
{
    NSLog(@"注册失败%@",[error description]);
}

//-(void)xmppRoster:(XMPPRoster *)sender didReceiveRosterItem:(DDXMLElement *)item
//{
//    NSLog(@"%@",item);
//}

- (void)xmppRoster:(XMPPRoster *)sender didReceiveBuddyRequest:(XMPPPresence *)presence
{
    NSLog(@"%@",[presence description]);
}

-(void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence
{
    
    BuddyItem *buddyItem = [[BuddyItem alloc]init];
    buddyItem.buddyName = presence.from.user;
    buddyItem.buddyStatus = presence.status;
    buddyItem.buddyResource = presence.from.resource;
    NSLog(@"好友状态%@",[buddyItem description]);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(xmppManager:didReceiveNewPresenceWithBuddyItem:)]) {
        [self.delegate xmppManager:self didReceiveNewPresenceWithBuddyItem:buddyItem];
    }
    
}

-(void)xmppStream:(XMPPStream *)sender didSendPresence:(XMPPPresence *)presence
{
    BuddyItem *buddyItem = [[BuddyItem alloc]init];
    buddyItem.buddyName = presence.from.user;
    buddyItem.buddyStatus = presence.status;
    buddyItem.buddyResource = presence.from.resource;
    NSLog(@"我的状态%@",[buddyItem description]);

}

-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSLog(@"%@",message);
    MessageItem *newMessage = [[MessageItem alloc]init];
    newMessage.messageText = message.body;
    newMessage.isComposing = YES;
    newMessage.receivedDate = [NSDate date];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(xmppManager:didReceiveNewMessage:)]) {
        [self.delegate xmppManager:self didReceiveNewMessage:newMessage];
    }
    
    
}

-(void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message
{
    NSLog(@"%@",message);
    MessageItem *newMessage = [[MessageItem alloc]init];
    newMessage.messageText = message.body;
    newMessage.isComposing = NO;
    newMessage.receivedDate = [NSDate date];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(xmppManager:didReceiveNewMessage:)]) {
        [self.delegate xmppManager:self didReceiveNewMessage:newMessage];
    }

}

@end
