//
//  BuddyItem.m
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "BuddyItem.h"

@implementation BuddyItem

-(NSString *)description
{
    return [NSString stringWithFormat:@"好友名称：%@ ，好友状态：%@,好友使用客户端： %@",self.buddyName,self.buddyStatus,self.buddyResource];
}





@end
