//
//  Shose.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shose : NSObject
{
    NSString *name;
    NSString *board;
    NSInteger size;
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *board;
@property(nonatomic) NSInteger size;

-(id)initWithName: (NSString *)_name board: (NSString *)_board size: (NSInteger) _size;
+(id)shoseWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size;
+(id)shoseWithSize:(NSInteger) _size;
-(id)initWithName:(NSString *)_name;



//-(NSString *)whatYourBoard:(NSString *)_name;

@end
