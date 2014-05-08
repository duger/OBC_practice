//
//  Kingdom.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Kingdom.h"
#import "People.h"

static NSInteger kingdomtime = 1;

@implementation Kingdom
-(id)initWithKing:(People *)king farmer:(NSMutableArray *)farmer worker:(NSMutableArray *)worker actor:(NSMutableArray *)actor
{
    
    if (self = [super init]) {
        self.king = king;
        self.farmer = farmer;
        self.worker = worker;
        self.actor = actor;
    }
    return self;
}
+(id)kingdomWithKing:(People *)king farmer:(NSMutableArray *)farmer worker:(NSMutableArray *)worker actor:(NSMutableArray *)actor
{
    Kingdom *kingdom = [[Kingdom alloc]initWithKing:king farmer:farmer worker:worker actor:actor];
    return [kingdom autorelease];
}

-(void)kingdomTime
{
    
    if (kingdomtime % 7 == 0) {
        NSLog(@"\n现在是第 %ld 周，星期日 。",(kingdomtime / 7));
    }else{
    NSLog(@"\n现在是第 %ld 周，星期 %ld。",(kingdomtime / 7) + 1,(kingdomtime % 7));
    }
    kingdomtime++;
}

-(void)reportDuty
{
    
    for (People *farmer in self.farmer){
        [farmer reportDuty];
        NSLog(@"*************************************************");
    }
    for (People *work in self.worker){
        [work reportDuty];
        NSLog(@"*************************************************");
    }
    for (People *actor in self.actor){
        [actor reportDuty];
        NSLog(@"*************************************************");
    }
    
}

-(void)sundayReport
{
    for (People *farmer in self.farmer){
        [farmer sundayReport];
        NSLog(@"\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    for (People *work in self.worker){
        [work sundayReport];
        NSLog(@"\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    for (People *actor in self.actor){
        [actor sundayReport];
        NSLog(@"\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    NSLog(@"人民的总资产是：%f",[self peoplesMoney]);
    NSLog(@"本周国王支出：%f",[self payperWeek]);

}

-(CGFloat)peoplesMoney
{
    CGFloat sum = 0;
    for (People *farmer in self.farmer){
        sum += [farmer peoplesMoney];
        }
    for (People *work in self.worker){
        sum += [work peoplesMoney];
        
        }
    for (People *actor in self.actor){
        sum += [actor peoplesMoney];
        }
    return sum;
}
-(void)kingsMoney
{
    self.king.money -= [self payperWeek];
    NSLog(@"国王的资产：%f",self.king.money);
}


-(CGFloat)payperWeek
{
    CGFloat sum = 0;
    for (People *farmer in self.farmer){
        sum += [farmer payperDay];
    }
    for (People *work in self.worker){
        sum += [work payperDay];
    }
    for (People *actor in self.actor){
        sum += [actor payperDay];
    }
    return sum;
}

-(void)payPeople
{
    for (People *farmer in self.farmer){
        [farmer earnPay];
          }
    for (People *work in self.worker){
        [work earnPay];
    }
    for (People *actor in self.actor){
        [actor earnPay];
         }
}

- (void)dealloc
{
    NSLog(@"kingdom died");
    [_king release];
    [_farmer release];
    [_worker release];
    [_actor release];
    [super dealloc];
}
@end
