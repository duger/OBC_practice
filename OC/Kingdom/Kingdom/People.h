//
//  People.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface People : NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *job;
@property(nonatomic,retain)NSString *duty;
@property(nonatomic,assign)CGFloat money;

-(id)initWithName:(NSString *)name job:(NSString *)job duty:(NSString *)duty money:(CGFloat)money;
+(id)peopleWithName:(NSString *)name job:(NSString *)job duty:(NSString *)duty money:(CGFloat)money;

-(void)reportDuty;
-(void)sundayReport;
-(void)earnPay;
-(CGFloat)peoplesMoney;
-(CGFloat)payperDay;
@end
