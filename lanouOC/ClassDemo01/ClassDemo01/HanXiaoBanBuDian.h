//
//  HanXiaoBanBuDian.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Medicine.h"

@interface HanXiaoBanBuDian : Medicine
{
    NSString *attenction;
}
@property(nonatomic,retain) NSString *attenction;

-(id)initWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction;

+(id)hanXiaoBanBuDianWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction;

-(id)initWithPrice:(CGFloat)_price;
+(id)hanXiaoBanBuDianWithPrice:(CGFloat)_price;

-(NSString *)attenction;
-(void)setAteenction:(NSString *)_attenction;

-(void) howToUse;
@end
