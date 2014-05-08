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
-(id)initWithKing:(People *)king people:(NSMutableArray *)people
{
    if(self = [super init]){
        self.king = king;
        self.people = people;
    }
    return self;
}

+(id)kingdomWithKing:(People *)king people:(NSMutableArray *)people
{
    Kingdom *kingdom = [[Kingdom alloc]initWithKing:king people:people];
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
    
    for (People *people in self.people){
        [people reportDuty];
        NSLog(@"*************************************************");
    }
       
}

-(void)sundayReport
{
    for (People *people in self.people){
        [people sundayReport];
        NSLog(@"\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    NSLog(@"人民的总资产是：%.2f",[self peoplesMoney]);
    NSLog(@"本周国王支出：%.2f",[self payperWeek]);

}

-(CGFloat)peoplesMoney
{
    CGFloat sum = 0;
    for (People *people in self.people){
        sum += [people peoplesMoney];
        }
    
    return sum;
}
-(void)kingsMoney
{
    self.king.money -= [self payperWeek];
    NSLog(@"国王的资产：%.2f",self.king.money);
}


-(CGFloat)payperWeek
{
    CGFloat sum = 0;
    for (People *people in self.people){
        sum += [people payperDay];
    }
        return sum;
}

-(void)payPeople
{
    for (People *people in self.people){
        [people earnPay];
          }
    
}

- (void)dealloc
{
    NSLog(@"kingdom died");
    [_people release];
    [_king release];
    [super dealloc];
}
@end
