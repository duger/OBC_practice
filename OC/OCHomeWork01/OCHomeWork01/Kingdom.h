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
@property(nonatomic,retain) NSMutableArray *person;


@property(nonatomic,retain) NSMutableArray *farmer;
@property(nonatomic,retain) NSMutableArray *worker;
@property(nonatomic,retain) NSMutableArray *actor;

-(id)initWithKing:(People *)king farmer:(NSMutableArray *)farmer worker:(NSMutableArray *)worker actor:(NSMutableArray *)actor;
+(id)kingdomWithKing:(People *)king farmer:(NSMutableArray *)farmer worker:(NSMutableArray *)worker actor:(NSMutableArray *)actor;
-(void)payPeople;
-(void)kingdomTime;
-(void)reportDuty;
-(void)sundayReport;
-(CGFloat)peoplesMoney;
-(CGFloat)payperWeek;
-(void)kingsMoney;
@end
