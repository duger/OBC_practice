//
//  Fraction.h
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    int _letxxx;
}
-(void)setLetxxx:(int)letxxx;
@property(nonatomic) int numerator;
@property(nonatomic) int deniminator;
@property(nonatomic) int letxxx;

-(id)initWithNumerator:(int)numerator deniminator:(int)deniminator;

-(void) reduce;
-(int) gcdFunction;

-(void) description;

-(Fraction *)addFraction:(Fraction *)fraction;

-(Fraction *)reduceFraction:(Fraction *)fraction;
-(Fraction *)multiplyFraction:(Fraction *)fraction;
-(Fraction *)divideFraction:(Fraction *)fraction;
@end
