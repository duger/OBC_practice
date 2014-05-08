//
//  SQLiteProtocol.h
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SQLiteProtocol <NSObject>

-(NSString *)insertSQL:(NSString *)tableName;
-(NSString *)removeFromSQL;
-(NSString *)updateSQL;


@end
