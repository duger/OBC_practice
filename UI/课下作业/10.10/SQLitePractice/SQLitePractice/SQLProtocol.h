//
//  SQLProtocol.h
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@protocol SQLProtocol <NSObject>

-(NSString *)insertSQL;

-(NSString *)removeSQL:(Person *)person;

-(NSString *)updateSQL:(Person *)person;
@end
