//
//  HanXiaoBanBuDian.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "HanXiaoBanBuDian.h"

@implementation HanXiaoBanBuDian
@synthesize attenction;

-(id)initWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction
{
    if (self = [super initWithName:_name affect:_affect ISD:_ISD price:_price]) {
        attenction = _attenction;
    }
    return self;
    
}

+(id)hanXiaoBanBuDianWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction
{
    HanXiaoBanBuDian *medicine = [[HanXiaoBanBuDian alloc]initWithName:_name affect:_affect ISD:_ISD price:_price attenction:_attenction];
    return [medicine autorelease];
}
-(id)initWithPrice:(CGFloat)_price
{
    if (self = [super initWithName:nil affect:nil ISD:nil price:_price]) {
        attenction = nil;
    }
    return self;
}

+(id)hanXiaoBanBuDianWithPrice:(CGFloat)_price
{
    HanXiaoBanBuDian *medicine = [[HanXiaoBanBuDian alloc]initWithName:nil affect:nil ISD:nil price:_price attenction:nil];
    return [medicine autorelease];
}

-(NSString *)attenction
{
    return attenction;
}
-(void)setAteenction:(NSString *)_attenction
{
    attenction = _attenction;
}

-(void)howToUse
{
    NSLog(@"%@",attenction);
}

- (void)dealloc
{
    [attenction release];
    NSLog(@"含笑半步颠 died");
    [super dealloc];
}
@end
