//
//  main.m
//  Kingdom
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import "Kingdom.h"
#import "Farmer.h"
#import "Worker.h"
#import "Actor.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        /******************************************************************
         
         二、在一个遥远的国度，有个国王叫山鲁亚尔，他有一些臣民，他们的职业分别是农民，工人和演员。农民的职责是种地，工人的职责是修理，演员的职责是演出。
         臣民们不用为了生计发愁，因为国王会每个星期给他们发工资，只是工资水平不同而已。
         国王每天的职责就是督促子民们干活。
         由于工资水平比较高，国王的积蓄有限，所以很不幸，这个可怜的国王再第四周就破产了。
         要求输出内容：
         1、当前是第几周的星期几。
         2、每一天每个子民的工作情况：包括名字、职业和工作内容。
         3、每周每个子民的收入情况，以及他们的财富总额。
         4、每周国王的支出总额，以及他的财富余额。
         5、最后宣布国王破产。
         *88888888888888888888888888888888888888888888888888888888888888888***/
        People *king = [People peopleWithName:@"王甫" job:@"国王" duty:@"管理臣民" money:KINGMONEY];
        
        NSMutableArray *actor = [[NSMutableArray alloc]initWithObjects:
                                 [People peopleWithName:@"王五" job:@"演员" duty:@"表演" money:0],
                                 [People peopleWithName:@"王超" job:@"演员" duty:@"表演那啥" money:0],
                                 [People peopleWithName:@"小凡" job:@"演员" duty:@"表演那个" money:0],
                                 [People peopleWithName:@"吴丽" job:@"演员" duty:@"表演那个啥" money:0],nil];
        NSMutableArray *people = [[NSMutableArray alloc]initWithObjects: nil];
        
        
        Kingdom *kingdom = [Kingdom kingdomWithKing:king people:people];
        [kingdom.people addObject:[People peopleWithName:@"张三" job:@"农民" duty:@"种地" money:0]];
        [kingdom.people addObject:[People peopleWithName:@"周超" job:@"农民" duty:@"种地" money:0]];
        [kingdom.people addObject:[People peopleWithName:@"李四" job:@"工人" duty:@"修理" money:0]];
        [kingdom.people addObject:[People peopleWithName:@"大饼" job:@"工人" duty:@"修理" money:0]];
        [kingdom.people addObjectsFromArray:actor];
        [actor release];
        [people release];
        
            for (NSInteger i = 1; 1 ; i++) {
            NSLog(@"\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
            [kingdom kingdomTime];
            [kingdom payPeople];
            [kingdom reportDuty];
            
            if (i % 7 == 0) {
                [kingdom sundayReport];
                [kingdom kingsMoney];
            }
            //            NSLog(@"kingkkkk%f",kingdom.king.money);
            if (kingdom.king.money <= [kingdom payperWeek]) {
                NSLog(@"\n钱不够用了！！！下周就破产啦！！");
                break;
            }
            
        }

        
    }
    return 0;
}

