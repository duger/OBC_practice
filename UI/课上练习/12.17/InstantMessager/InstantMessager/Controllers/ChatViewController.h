//
//  ChatViewController.h
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPManager.h"

@interface ChatViewController : UITableViewController<XMPPManagerDelegate>

@property(nonatomic, strong)NSMutableArray *messageArray;
//自定义初始化方法
-(id)initWithStyle:(UITableViewStyle)style buddyName:(NSString *)buddyName;

@end
