//
//  Adidas.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Adidas.h"

@implementation Adidas
-(id)initWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size madeCountry:(NSString *)_madeCountry useKind:(NSString *)_useKind price:(CGFloat)_price
{
    if (self = [super initWithName:_name board:_board size:_size]) {
        madeCountry = _madeCountry;
        useKind = _useKind;
        price = _price;
    }
    return self;
}
+(id)adidasWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size madeCountry:(NSString *)_madeCountry useKind:(NSString *)_useKind price:(CGFloat)_price
{
    Adidas *shose = [[Adidas alloc]initWithName:_name board:_board size:_size madeCountry:_madeCountry useKind:_useKind price:_price];
    return [shose autorelease];
}
+(id)adidasWithSize:(NSString *)_madeCountry
{
    Adidas *shoes = [[Adidas alloc]initWithName:nil board:nil size:0 madeCountry:_madeCountry useKind:nil price:0];
    return [shoes autorelease];
}
-(id)initWithName:(NSString *)_useKind
{
    if (self = [super initWithName:nil board:nil size:0]) {
        madeCountry = nil;
        useKind = _useKind;
        price = 0;
    }
    return self;
}



-(NSString *) madeCountry
{
    return madeCountry;
}
-(void)setMadeCountry: (NSString *)_madeCountry
{
    madeCountry = _madeCountry;
}

-(NSString *) useKind
{
    return useKind;
}
-(void)setUseKind: (NSString *) _useKind
{
    useKind = _useKind;
}

-(CGFloat)price
{
    return price;
}
-(void)setPrice:(CGFloat)_price
{
    price = _price;
}

- (void)dealloc
{
    [madeCountry release];
    [useKind release];
    [super dealloc];
}

@end
