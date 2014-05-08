//
//  Medicine.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Medicine.h"

@implementation Medicine
@synthesize name,affect;

-(NSString *)ISD
{
    return ISD;
}

-(void) setISD: (NSString *)_ISD
{
    ISD = _ISD;
}

-(CGFloat)price
{
    return price;
}
-(void) setPrice: (CGFloat)_price
{
    price = _price;
}

-(id)initWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price: (CGFloat) _price
{
    if (self = [super init]) {
        name = _name;
        affect = _affect;
        ISD = _ISD;
        price = _price;
        
    }
    return self;
    
}
+(id)medicineWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price
{
    Medicine *medicine = [[Medicine alloc]initWithName:_name affect:_affect ISD:_ISD price:_price];
    return [medicine autorelease];
}

-(id)initWithPrice:(CGFloat)_price
{
    if (self = [super init]) {
        name = nil;
        affect = nil;
        ISD = nil;
        price = _price;
    }
    return self;
}
+(id)medicineWithPrice:(CGFloat)_price
{
    Medicine *medicine = [[Medicine alloc]initWithName:nil affect:nil ISD:nil price:_price];
    return [medicine autorelease];
}
-(void) useInfo
{
    NSLog(@"本药的作用是：%@",affect);
}

-(id) initWithName:(NSString *) _name andAffect:(NSString *) _affect andISD:(NSString *) _ISD andPrice: (CGFloat) _price
{
    self = [super init];
    if (self) {
        name = _name;
        affect = _affect;
        ISD = _ISD;
        price = _price;
    }
    return self;
}

- (void)dealloc
{
    [name release];
    [affect release];
    [ISD release];
    NSLog(@"medecine died");
    [super dealloc];
}

@end
