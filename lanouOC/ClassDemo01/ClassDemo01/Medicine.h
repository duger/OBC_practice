//
//  Medicine.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medicine : NSObject
{
    NSString *name;
    NSString *affect;
    NSString *ISD;
    CGFloat  price;
}


@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *affect;
@property(nonatomic,retain) NSString *ISD;
@property(nonatomic) CGFloat price;


-(NSString *)ISD;
-(void) setISD: (NSString *)_ISD;
-(CGFloat)price;
-(void) setPrice: (CGFloat)_price;

-(id)initWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price: (CGFloat) _price;
+(id)medicineWithName:(NSString *)_name affect:(NSString *)_affect ISD:(NSString *)_ISD price:(CGFloat)_price;
-(id)initWithPrice:(CGFloat)_price;
+(id)medicineWithPrice:(CGFloat)_price;

-(void) useInfo;
-(id) initWithName:(NSString *) _name andAffect:(NSString *) _affect andISD:(NSString *) _ISD andPrice: (CGFloat) _price;



@end
