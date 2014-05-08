//
//  XieLiTing.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Medicine.h"

@interface XieLiTing : Medicine
{
    NSString *package;
    NSString *smell;
}

@property(nonatomic,retain) NSString *package;
@property(nonatomic,retain) NSString *smell;

-(id)initWithName:(NSString *)_name andAffect:(NSString *)_affect andISD:(NSString *)_ISD andPrice:(CGFloat)_price andPackage:(NSString *)_package andSmell:(NSString *)_smell;

-(id)xieLiTingWithName:(NSString *)_name andAffect:(NSString *)_affect andISD:(NSString *)_ISD andPrice:(CGFloat)_price andPackage:(NSString *)_package andSmell:(NSString *)_smell;

-(id)initWithPrice:(CGFloat)_price;
+(id)xieLiTingWithPrice:(CGFloat)_price;

-(NSString *)package;
-(void)setPackage: (NSString *)_package;
-(NSString *)smell;
-(void)setSmell: (NSString *)_smell;
-(void) eat;
@end
