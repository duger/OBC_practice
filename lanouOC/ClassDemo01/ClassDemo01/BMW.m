//
//  BMW.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "BMW.h"

@implementation BMW

@synthesize kind,topSpeed;

-(id)initWithNumber:(NSInteger)_number andName:(NSString *)_name andWeight:(float)_weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed
{
    if (self = [super initWithNumber:_number andName:_name andWeight:_weight]) {
        kind = _kind;
        topSpeed =_topSpeed;
    }
    return self;
}

+(id)bmwWithNumber:(NSInteger)_number name:(NSString *)_name weight:(float)_weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed
{
    BMW *car = [[BMW alloc] initWithNumber:_number andName:_name andWeight:_weight kind:_kind topSpeed:_topSpeed];
    return [car autorelease];
}

+(id)bmwWithName:(NSString *)_name
{
    BMW *car = [[BMW alloc] initWithNumber:0 andName:_name andWeight:0 kind:nil topSpeed:0];
    return [car autorelease];
}
-(id)initWithWeight:(float)_weight
{
    if (self = [super initWithNumber:0 andName:nil andWeight:_weight]) {
        kind = nil;
        topSpeed = 0;
    
    }
    return self;
}

-(NSString *) kind
{
    return kind;
}
-(void)setKind: (NSString *)_kind
{
    kind = _kind;
}

-(NSInteger) topSpeed
{
    return topSpeed;
}
-(void)setTopSpeed: (NSInteger) _topSpeed
{
    topSpeed = _topSpeed;
}

- (void)dealloc
{
    [kind release];
    [super dealloc];
}
@end
