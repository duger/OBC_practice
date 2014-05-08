//
//  BaoHeWan.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "BaoHeWan.h"

@implementation BaoHeWan
@synthesize attenction;

-(id)initWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction
{
    if (self = [super initWithName:_name affect:_affect ISD:_ISD price:_price]) {
        attenction = _attenction;
        
    }
    return self;
}

+(id)baohewanWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price attenction:(NSString *)_attenction
{
    BaoHeWan *medicine = [[BaoHeWan alloc]initWithName:_name affect:_affect ISD:_ISD price:_price attenction:_attenction];
    return [medicine autorelease];
}

-(id)initWithPrice:(CGFloat)_price
{
    if (self = [super initWithName:nil affect:nil ISD:nil price:_price]) {
        attenction = nil;
    }
    return self;
}

+(id)baoHeWanWithPrice:(NSString *)_attenction
{
    BaoHeWan *medicine = [[BaoHeWan alloc]initWithName:nil affect:nil ISD:nil price:0 attenction:_attenction];
    return [medicine autorelease];
}

-(void)howToUse
{
    NSLog(@"每日三次，每次8丸儿！");
}

- (void)dealloc
{
    [attenction release];
    [super dealloc];
}

@end
