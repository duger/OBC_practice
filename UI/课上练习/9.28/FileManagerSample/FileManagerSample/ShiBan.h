//
//  ShiBan.h
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShiBan : NSObject<NSCoding>

@property(nonatomic,retain) NSNumber *sid; //学号
@property(nonatomic,copy) NSString *sname; //姓名
@property(nonatomic,retain) UIImage *sheadImg; //头像

-(id)initWithContentOfFile:(NSString *)path;
-(void)writeToFile:(NSString *)path atomically:(BOOL)atomic;

@end
