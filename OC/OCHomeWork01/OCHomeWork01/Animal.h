//
//  Animal.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) CGFloat eatFood;
@property(nonatomic,assign) NSInteger babyBorn;
@property(nonatomic,assign) NSInteger animalCount;


-(id)initWithName:(NSString *)name eatFood:(CGFloat)eatFood babyBorn:(NSInteger)babyBorn animalCount:(NSInteger)animalCount;
+(id)animalWithName:(NSString *)name eatFood:(CGFloat)eatFood babyBorn:(NSInteger)babyBorn animalCount:(NSInteger)animalCount;

@end
