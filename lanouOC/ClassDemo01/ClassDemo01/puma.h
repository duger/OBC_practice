//
//  puma.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Shose.h"

@interface puma : Shose
{
    NSString *madeCountry;
    NSString *useKind;
    CGFloat   price;
}

@property(nonatomic,retain) NSString *madeCountry;
@property(nonatomic,retain) NSString *useKind;
@property(nonatomic) CGFloat price;

-(id)initWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size madeCountry:(NSString *)_madeCountry useKind:(NSString *)_useKind price:(CGFloat)_price;

+(id)pumaWithName:(NSString *)_name board:(NSString *)_board size:(NSInteger)_size madeCountry:(NSString *)_madeCountry useKind:(NSString *)_useKind price:(CGFloat)_price;

+(id)pumaWithSize:(NSString *)_madeCountry;
-(id)initWithName:(NSString *)_useKind;

-(NSString *)madeCountry;
-(void)setMadeCountry:(NSString *)_madeCountry;

-(NSString *)useKind;
-(void)setUseKind:(NSString *)_useKind;

-(CGFloat)price;
-(void)setPrice:(CGFloat)_price;

@end
