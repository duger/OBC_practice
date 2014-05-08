//
//  Quick.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Quick.h"

@implementation Quick

-(id)initWithName:(NSString *)_name andAffect:(NSString *)_affect andISD:(NSString *)_ISD andPrice:(CGFloat)_price andPackage:(NSString *)_package andSmell:(NSString *)_smell
{
    if (self = [super initWithName:_name andAffect:_affect andISD:_ISD andPrice:_price]) {
        package = _package;
        smell = _smell;
    }
    return self;
}

-(id)quickWithName:(NSString *)_name andAffect:(NSString *)_affect andISD:(NSString *)_ISD andPrice:(CGFloat)_price andPackage:(NSString *)_package andSmell:(NSString *)_smell
{
    Quick *medicine = [[Quick alloc] initWithName:_name andAffect:_affect andISD:_ISD andPrice:_price andPackage:_package andSmell:_smell];
    return [medicine autorelease];
}

-(id)initWithPrice:(CGFloat)_price
{
    if (self = [super initWithName:nil affect:nil ISD:nil price:_price]) {
        package = nil;
        smell = nil;
    }
    return self;
}

+(id)quickWithPrice:(CGFloat)_price
{
    Quick *medicine = [[Quick alloc]initWithName:nil andAffect:nil andISD:nil andPrice:_price andPackage:nil andSmell:nil];
    return [medicine autorelease];
}

-(NSString *)package
{
    return package;
    
}
-(void)setPackage: (NSString *)_package
{
    package = _package;
}

-(NSString *)smell
{
    return smell;
}
-(void)setSmell: (NSString *)_smell
{
    smell = _smell;
}

-(void) eat
{
    NSLog(@"来点儿水，直接吞服");
}

- (void)dealloc
{
    [package release];
    [smell release];
    [super dealloc];
}
@end
