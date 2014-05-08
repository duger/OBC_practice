//
//  Kingdom.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class People;
#define KINGMONEY 1300.0
#define FARMERPAY  30.0
#define WORKERPAY 40.0
#define ACTORPAY 50.0

@interface Kingdom : NSObject

@property(nonatomic,retain) People *king;
@property(nonatomic,retain) NSMutableArray *people;




-(id)initWithKing:(People *)king people:(NSMutableArray *)people;
+(id)kingdomWithKing:(People *)king people:(NSMutableArray *)people;
-(void)payPeople;
-(void)kingdomTime;
-(void)reportDuty;
-(void)sundayReport;
-(CGFloat)peoplesMoney;
-(CGFloat)payperWeek;
-(void)kingsMoney;
@end
