//
//  Person.h
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject<SqlProtocol>

@property(nonatomic,copy) NSString *pid;
@property(nonatomic,copy) NSString *pname;
@property(nonatomic,copy) NSString *page;
@end
