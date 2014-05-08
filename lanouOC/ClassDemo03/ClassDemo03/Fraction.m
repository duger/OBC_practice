//
//  Fraction.m
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction


-(void)setLetxxx:(int)letxxx
{
    _letxxx = letxxx;
}

//@synthesize numerator = _numerator,deniminator = _deniminator;
-(id)initWithNumerator:(int)numerator deniminator:(int)deniminator
{
    if (self = [super init]) {
        [self setNumerator:numerator];
        [self setDeniminator:deniminator];
    }
    return self;
}
-(void) reduce
{
    int gcd = [self gcdFunction];
    self.numerator /= gcd;
    self.deniminator /= gcd;
   
    
}

-(int) gcdFunction
{
    
    int numer = self.numerator ;
    int denom = self.deniminator;
    
    int n = 0;
    
    if (numer < denom) {
        int temp = numer;
        numer = denom;
        denom = temp;
    }
    
    while ((n = numer % denom)!= 0) {
        numer = denom;
        denom = n;
    }
    if (denom < 0) {
        return -denom;
    }else{
        return denom;
    }
    
}

-(Fraction *)addFraction:(Fraction *)fraction
{
    int numer = self.numerator * fraction.deniminator + self.deniminator * fraction.numerator;
    int denom = self.deniminator * fraction.deniminator;
    Fraction *fraction1 = [[Fraction alloc]initWithNumerator:numer deniminator:denom];
    return fraction1;
    
}
-(Fraction *)multiplyFraction:(Fraction *)fraction
{
    int numer = self.numerator * fraction.numerator;
    int denom = self.deniminator * fraction.deniminator;
    Fraction *fraction1 = [[Fraction alloc] initWithNumerator:numer deniminator:denom];
    [fraction1 reduce];
    return fraction1;
}

-(Fraction *)reduceFraction:(Fraction *)fraction
{
    int numer = self.numerator * fraction.deniminator - self.deniminator * fraction.numerator;
    int denom = self.deniminator * fraction.deniminator;
    Fraction *fraction1 = [[Fraction alloc]initWithNumerator:numer deniminator:denom];
    return fraction1;
}

-(Fraction *)divideFraction:(Fraction *)fraction
{
    int numer = self.numerator * fraction.deniminator;
    int denom = self.deniminator * fraction.numerator;
    Fraction *fraction1 = [[Fraction alloc]initWithNumerator:numer deniminator:denom];
    [fraction1 reduce];
    return fraction1;
}

-(void) description
{
    NSLog(@"%d / %d",self.numerator,self.deniminator);
}

@end
