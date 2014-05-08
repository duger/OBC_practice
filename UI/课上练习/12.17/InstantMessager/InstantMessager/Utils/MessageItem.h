//
//  MessageItem.h
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageItem : NSObject

@property(nonatomic ,strong) NSString *messageText;
@property(nonatomic ,assign) BOOL isComposing;
@property(nonatomic ,strong) NSDate *receivedDate;

@end
