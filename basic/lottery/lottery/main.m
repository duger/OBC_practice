//
//  main.m
//  lottery
//
//  Created by Duger on 13-5-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //创建日期对象
        NSDate *now = [[NSDate alloc] init];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *weekComponents = [[NSDateComponents alloc] init];
        
        //创建随机数生成器
        srandom((unsigned)time(NULL));
       
        NSMutableArray *array;
        array = [[NSMutableArray alloc] init];
//        NSLog(@"first item = %@",[array objectAtIndex:0]);
        
        int i;
        for (i=0; i<10; i++) {
            
            [weekComponents setWeek:i];
            
            //创建日期对象，i周以前的
            NSDate *iWeeksFromNow;
            iWeeksFromNow = [cal dateByAddingComponents:weekComponents toDate:now options:0];
            
            //创建新的LotteryEntry 的实例
            LotteryEntry *newEntry = [[LotteryEntry alloc]initWithEntryDate:iWeeksFromNow];
//            [newEntry prepareRandomNumbers];
//            [newEntry setEntryDate:iWeeksFromNow];
            
            //将LotteryEntry对象加入到队列中
            [array addObject:newEntry];
            
            
           
            
        }
        for (LotteryEntry *entryToPrint in array) {
             //显示其内容
            NSLog(@"%@",entryToPrint);
        }
       
    }
    return 0;
}

