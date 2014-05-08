//
//  Audi.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Audi.h"

@implementation Audi
@synthesize kind,topSpeed;

-(id)initWithNumber:(NSInteger)_number andName:(NSString *)_name andWeight:(float)_weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed
{
    if (self = [super initWithNumber:_number andName:_name andWeight:_weight]) {
        kind = _kind;
        topSpeed = _topSpeed;
        
    }
    return self;
}

+(id)audiWithNumber:(NSInteger)_number name:(NSString *)_name weight:(float) _weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed
{
    Audi *car = [[Audi alloc] initWithNumber:_number andName:_name andWeight:_weight kind:_kind topSpeed:_topSpeed];
    return [car autorelease];
}

-(id)initWithKind:(NSString *)_kind
{
    if (self = [super initWithNumber:0 andName:nil andWeight:0]) {
        kind = _kind;
        topSpeed = 0;
    }
    return self;
}
+(id)audiWithTopSeed:(NSInteger)_topSpeed;
{
    Audi *car = [[Audi alloc]initWithNumber:0 andName:nil andWeight:0 kind:nil topSpeed:_topSpeed];
    return [car autorelease];
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
