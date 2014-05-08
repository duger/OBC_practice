//
//  SqlProtocol.h
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@protocol SqlProtocol <NSObject>

-(NSString *)insertSQL;
-(NSString *)removeSQL:(int)index;
-(NSString *)updateSQL:(Person *)person;


@end
