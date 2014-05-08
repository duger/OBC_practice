//
//  Zoo.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Animal;
@class Panda;
@class Elephant;
@class Kangaroo;
#define FOODS 10000.0
#define PANDASUM 5
#define ELEPHANTSUM 5
#define KANGAROOSUM 5
#define PANDEAT 10.0
#define ELEPHANTEAT 30.0
#define KANGAROOEAT 20.0
#define PANDABABYBORN 5
#define ELEPHANTBABYBORN 15
#define KANGAROOBABYBORN 10

@interface Zoo : NSObject

@property(nonatomic,assign) CGFloat foods;
@property(nonatomic,retain) Panda *panda;
@property(nonatomic,retain) Elephant *elephant;
@property(nonatomic,retain) Kangaroo *kangaroo;

-(id)initWithFoods:(CGFloat) foods panda:(Panda *)panda elephant:(Elephant *)elephant kangaroo:(Kangaroo *)kangaroo;
+(id)zooWithFoods:(CGFloat)foods Panda:(Panda *)panda elephant:(Elephant *)elephant kangaroo:(Kangaroo *)kangaroo;
-(void)animalEat:(CGFloat)animalEat andSum:(CGFloat)animalSum;
-(void)animalEat2;
-(void)animalborth;
-(CGFloat)animalDayEat;
-(void)animalBorth2:(NSInteger)day;
-(void)perDayReport:(NSInteger) day;
@end
