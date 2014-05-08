//
//  main.m
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import "Student.h"
#import "Medicine.h"
#import "BMW.h"
#import "Banz.h"
#import "Audi.h"
#import "Vw.h"
#import "Cc.h"
#import "GanMaoQing.h"
#import "BaoHeWan.h"
#import "XieLiTing.h"
#import "Quick.h"
#import "HanXiaoBanBuDian.h"
#import "Anta.h"
#import "Nike.h"
#import "Adidas.h"
#import "puma.h"
#import "Lining.h"


//@interface Person : NSObject
//{
//    NSString *_name;  //姓名
//    NSString *_sex;   //性别
//    NSString *_hobby;   //爱好
//    int       _age;     //年龄
//    NSInteger _id;      //ID
//    CGFloat   _weight;  //重量
//    
//}
//
//-(void) sayHi;
//@end
//
//@implementation Person
//
//-(void) sayHi{
//    NSLog(@"To be or not to be,that is a question!");
//}
//
//@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
//        NSLog(@"To be or not to be, that is a question!");
        Person *student = [[Person alloc] init];
//        student -> _name = @"wana";
        [student sayHi];
        
        Car *car1 = [[Car alloc] initWithNumber:02 andName:@"Benz" andWeight:890.45];
        [car1 drive];
        [car1 introduceYourself];
        
        
        [student eat];
        [student setName];
        [student getName];
        
        Student *student01 = [[Student alloc] init];
        [student01 goToClass];
        
        @try {
            [student getName];
        }
        @catch (NSException *exception) {
//            [exception name],[exception reason];
            NSLog(@"catch exception %@ %@",[exception name],[exception reason]);
        }
        @finally {
            ;
        }
        
/************************** Medicine ***************************/
    HanXiaoBanBuDian *medc1 = [[HanXiaoBanBuDian alloc] initWithName:@"含笑半步癫" andAffect: @"" andISD:@"4444444444" andPrice:444.44];
    [medc1 setAffect:@"居家旅行杀人灭口必备良药"];
    NSLog(@"\n药品名：%@ 价格：%.2f \n药品功效：%@ \n条形码：%@",medc1.name,medc1.price,medc1.affect, medc1.ISD);
        NSLog(@"%@",medc1.ISD);
        [medc1 release];
        Medicine *mdicine2 = [[Quick alloc]initWithName:@"快克" andAffect:@"治感冒" andISD:@"3434535" andPrice:34 andPackage:@"胶囊" andSmell:@"无味儿"];
        NSLog(@"\n药品名：%@ 价格：%.2f \n药品功效：%@ \n条形码：%@",mdicine2.name,mdicine2.price,mdicine2.affect,mdicine2.ISD);
        Medicine *m3 = [[Medicine alloc]init];
        m3 = [mdicine2 retain];
        NSLog(@"medc1: %ld",mdicine2.retainCount);

/**************************** Car ******************************/



/**************************** Shose ******************************/



    }
    return 0;
}

