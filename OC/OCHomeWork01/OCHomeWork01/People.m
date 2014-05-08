//
//  People.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "People.h"
#import "Kingdom.h"

@implementation People
-(id)initWithName:(NSString *)name job:(NSString *)job duty:(NSString *)duty money:(CGFloat)money
{
    if (self = [super init]) {
        self.name = name;
        self.job = job;
        self.duty = duty;
        self.money = money;
    }
    return self;
}
+(id)peopleWithName:(NSString *)name job:(NSString *)job duty:(NSString *)duty money:(CGFloat)money
{
    People *people = [[People alloc]initWithName:name job:job duty:duty money:money];
    return [people autorelease];
}

-(void)reportDuty
{
    NSLog(@"\n我叫 %@,我的工作是%@ ，我的职责是：%@.",self.name,self.job,self.duty);
}

-(void)sundayReport
{
    if ([self.job isEqualToString:@"农民"]) {
        [self reportDuty];
        NSLog(@"\n我每周的工资是：%.2f ,我的总财产是 %.2f!",FARMERPAY,self.money);
    }
    if ([self.job isEqualToString:@"工人"]) {
        [self reportDuty];
        NSLog(@"\n我每周的工资是：%.2f ,我的总财产是 %.2f!",WORKERPAY,self.money);
    }
    if ([self.job isEqualToString:@"演员"]) {
        [self reportDuty];
        NSLog(@"\n我每周的工资是：%.2f ,我的总财产是 %.2f!",ACTORPAY,self.money);
    }

}

-(CGFloat)peoplesMoney
{
    CGFloat sum = 0;
    if ([self.job isEqualToString:@"农民"]) {
        sum += self.money;
    }
    if ([self.job isEqualToString:@"工人"]) {
        sum += self.money;
    }
    if ([self.job isEqualToString:@"演员"]) {
        sum += self.money;
    }
    return sum;
}
-(CGFloat)payperDay
{
    CGFloat sum = 0;
    if ([self.job isEqualToString:@"农民"]) {
        sum += FARMERPAY;
    }
    if ([self.job isEqualToString:@"工人"]) {
        sum  += WORKERPAY;
    }
    if ([self.job isEqualToString:@"演员"]) {
        sum += ACTORPAY;
    }
    return sum;
}
-(void)earnPay
{
    if ([self.job isEqualToString:@"农民"]) {
        self.money += FARMERPAY;
    }
    if ([self.job isEqualToString:@"工人"]) {
        self.money += WORKERPAY;
    }
    if ([self.job isEqualToString:@"演员"]) {
        self.money += ACTORPAY;
    }
}

- (void)dealloc
{
    NSLog(@"people died");
    [_name release];
    [_job release];
    [_duty release];
    [super dealloc];
}

@end
