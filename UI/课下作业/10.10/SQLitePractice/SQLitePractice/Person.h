//
//  Person.h
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<SQLProtocol>


@property(nonatomic,copy) NSString *pId;
@property(nonatomic,copy) NSString *pName;
@property(nonatomic,copy) NSString *pAge;
@end
