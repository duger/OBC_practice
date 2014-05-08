//
//  Shose.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Shose.h"

@implementation Shose
@synthesize name,board,size;
-(id)initWithName: (NSString *)_name board: (NSString *)_board size: (NSInteger) _size
{
    self = [super init];
    if (self) {
        name = _name;
        board = _board;
        size = _size;
    }
    return self;
}

+(id)shoseWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size
{
    Shose *shose = [[Shose alloc]initWithName:_name board:_board size:_size];
    return [shose autorelease];
}

+(id)shoseWithSize:(NSInteger) _size
{
    Shose *shose = [[Shose alloc]initWithName:nil board:nil size:_size];
    return [shose autorelease];
}

-(id)initWithName:(NSString *)_name
{
    if (self = [super init]) {
        name = _name;
        board = nil;
        size = 0;
    }
    return self;
    
}


//-(NSString *)whatYourBoard:(NSString *)_name
//{
//    if (name == _name)
//        
//        return board;
//}
- (void)dealloc
{
    [name release];
    [board release];
    [super dealloc];
}

@end
