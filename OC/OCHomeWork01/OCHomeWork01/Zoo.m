//
//  Zoo.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Zoo.h"
#import "Animal.h"
#import "Panda.h"
#import "Elephant.h"
#import "Kangaroo.h"


static NSInteger pandaDay = 0,elephantDay = 0,kangarooDay = 0;
@implementation Zoo
-(id)initWithFoods:(CGFloat) foods panda:(Panda *)panda elephant:(Elephant *)elephant kangaroo:(Kangaroo *)kangaroo
{
    if (self = [super init]) {
        self.foods = foods;
        self.panda = panda;
        self.elephant = elephant;
        self.kangaroo = kangaroo;
    }
    return self;
}

+(id)zooWithFoods:(CGFloat)foods Panda:(Panda *)panda elephant:(Elephant *)elephant kangaroo:(Kangaroo *)kangaroo
{
    Zoo *zoo = [[Zoo alloc]initWithFoods:foods panda:panda elephant:elephant kangaroo:kangaroo];
    return [zoo autorelease];
}

-(void)animalEat:(CGFloat)animalEat andSum:(CGFloat)animalSum
{
    self.foods -= animalEat*animalSum;
    
}

-(void)animalEat2
{
    self.foods -= self.panda.animalCount * PANDEAT;
    self.foods -= self.elephant.animalCount * ELEPHANTEAT;
    self.foods -= self.kangaroo.animalCount * KANGAROOEAT;
}

-(CGFloat)animalDayEat
{
    return (self.panda.animalCount * PANDEAT + self.elephant.animalCount * ELEPHANTEAT + self.kangaroo.animalCount * KANGAROOEAT);
}

-(void)animalBorth2:(NSInteger)day
{
    if(day % PANDABABYBORN == 0)
    {
        self.panda.animalCount++;
    }
    if(day  % ELEPHANTBABYBORN == 0){
        self.elephant.animalCount++;

    }
    if(day % KANGAROOBABYBORN == 0){
        self.kangaroo.animalCount++;
      
    }

}

-(void)animalborth
{
   
    if (pandaDay / PANDABABYBORN == 1 ) {
        self.panda.animalCount++;
        pandaDay = 0;
    }
    if(elephantDay / ELEPHANTBABYBORN == 1){
        self.elephant.animalCount++;
        elephantDay = 0;
    }
    if(kangarooDay / KANGAROOBABYBORN == 1){
        self.kangaroo.animalCount++;
        kangarooDay = 0;
    }
    pandaDay++;
    elephantDay++;
    kangarooDay++;
}

-(void)perDayReport:(NSInteger) day
{
     NSLog(@"\n第 %ld 天，\n熊猫数量为：%ld ,大象数量为：%ld ,\n袋鼠数量为：%ld \n饲料余量为：%.2f",day,[self.panda animalCount],[self.elephant animalCount],[self.kangaroo animalCount],self.foods);
}
@end
