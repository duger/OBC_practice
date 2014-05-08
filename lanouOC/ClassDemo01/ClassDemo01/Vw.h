//
//  Vw.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Car.h"

@interface Vw : Car
{
    NSString *kind;
    NSInteger topSpeed;
}
@property(nonatomic,retain) NSString *kind;
@property(nonatomic) NSInteger topSpeed;

-(id)initWithNumber:(NSInteger)_number andName:(NSString *)_name andWeight:(float)_weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed;

+(id)vwWithNumber:(NSInteger)_number name:(NSString *)_name weight:(float) _weight kind:(NSString *)_kind topSpeed:(NSInteger) _topSpeed;
+(id)vwWithTopSeed:(NSInteger)_topSpeed;
-(id)initWithKind:(NSString *)_kind;

-(NSString *) kind;
-(void)setKind: (NSString *)_kind;

-(NSInteger) topSpeed;
-(void)setTopSpeed: (NSInteger) _topSpeed;

@end
