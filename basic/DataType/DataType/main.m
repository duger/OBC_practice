//
//  main.m
//  DataType
//
//  Created by Duger on 13-7-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
//        int year;
//        printf("输入年份：");
//        scanf("%d",&year);
//        if ((year % 4 ==0 &&year % 100 != 0)|| year % 400 == 0) {
//            NSLog(@"这是闰年");
//        }else
//        {
//            NSLog(@"这是平年");
//        }
        
        
        for (int a=1; a<200; a++) {
            if (a % 3 ==0) {
                NSLog(@"能被整除的数为：%d",a);
            }
        }
       
        
        //乘法口诀表
        for (int x =1; x<10; x++) {
            for (int y = 1; y<=x; y++) {
                printf("   %d * %d = %d",x,y,x*y);
            }printf("\n");
        }
        
        int i = 0;
        do {
            i ++;
            NSLog(@"a=%d",i);
        } while (i <10);
        
        printf("__________\n");
        
        int flag = 3;
        for (int i=1; i<=5; i++) {
            if (i==flag) continue;
            NSLog(@"i=%d",i);
            
        }
        
        //switch循环
        int s = 20;
        switch (s) {
            case 30:
                NSLog(@"jige");
                break;
                
            default:
                NSLog(@"bujige");
                break;
        }
        
        /*
        int i = 10;
        float f = 2.343f;
        double d = 242.4332;
        char c = 'x';
        
        NSLog(@"i=%d",i);
        NSLog(@"f=%.2f",f);//float类型保留2位小数
        NSLog(@"d=%f",d);
        NSLog(@"c是%c",c);
        
        //打印C的ASCII值
        NSLog(@"ASCII是%d",c);
        
        //基本数据转换
        int i1= 242;
        int i2= 223;
        double d1= (i1+i2) * 1.5;
        NSLog(@"di=%e",d1);
        NSLog(@"d1=%f",d1);
        NSLog(@"d1=%.2e",d1);
        
        //强制数据类型转换
        float f1 = (float)((i1+i2) * 1.3);
        NSLog(@"f1=%f",f1);
        
        
        Byte b1 = 34;
        Byte b2 = 33;
        Byte b3 = (Byte)(b1 + b2);
        NSLog(@"b3=%d",b3);
        double f2 = 3E+50;
        int l1 =(int) f2;
        NSLog(@"l1=%i",l1);
        */
        
        
    }
    return 0;
}

