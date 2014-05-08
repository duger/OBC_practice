//
//  Animal.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Animal.h"
//#import "Zoo.h"

@implementation Animal
-(id)initWithName:(NSString *)name eatFood:(CGFloat)eatFood babyBorn:(NSInteger)babyBorn animalCount:(NSInteger)animalCount
{
    if (self = [super init]) {
        self.name = name;
        self.eatFood = eatFood;
        self.babyBorn = babyBorn;
        self.animalCount = animalCount;
    }
    return self;
}

+(id)animalWithName:(NSString *)name eatFood:(CGFloat)eatFood babyBorn:(NSInteger)babyBorn animalCount:(NSInteger)animalCount
{
    Animal *animal = [[Animal alloc]initWithName:name eatFood:eatFood babyBorn:babyBorn animalCount:animalCount];
    return [animal autorelease];
}

- (void)dealloc
{
    [_name release];
   
    [super dealloc];
}


@end
