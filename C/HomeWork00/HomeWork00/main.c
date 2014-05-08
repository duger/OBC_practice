//
//  main.c
//  HomeWork00
//
//  Created by Duger on 13-8-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
  /*  1、使用printf函数输出以下图形
      *
     ***
    *****    */
    
    int i =0,j = 0,k = 0;
    for (i = 1; i <= 3; i++) {
        for (j = 0; j <4 - i; j++) {
            printf(" ");
        }
        for (k = 0; k < 2*i - 1; k++) {
            printf("*");
        }
        printf("\n");
    
    } 
    
//    2、输入两个数，打印（printf）这两个数的和、差、积、商、以及余数。
    
    int num1 = 6,num2 = 4;
    //和
    printf("num1 + num2 = %d\n",num1 + num2);
    //差
    printf("num1 - num2 = %d\n",num1 - num2);
    //积
    printf("num1 * num2 = %d\n",num1 * num2);
    //商
    printf("num1 / num2 = %.2f\n",(float)num1 / (float)num2);
    //余数
    printf("num1 %% num2 = %d\n",num1 % num2);
    
    
//    3、如何在控制台输出 %
    printf("%%\n");
    
    
 /*   4、企业面试题：
    输入一个字节内的数（0~255）和移动位数。输出移位结果（要求循环移位）。
    提示：系统自带的移位都是非循环的   */
    
    //方法1：
    unsigned char num3 = 0,num4 = 0;
    int ch =0,count = 0 ,round = 0;
    printf("Please enter the number between 0 and 255 :");
    
    scanf("%d",&num3);
//    printf("%c\n",num3);
//    printf("%d\n",num3);
    printf("请选择方向：\"左\"请输入1，\"右\"请输入2：");
    scanf("%d",&ch );
    printf("请输入移动位数：");
    scanf("%d",&count); 
    if (ch == 1) {
        for (round = 1; round <= count; round++) {
            if (num3 >= 128) { //当数大于等于 1000 0000 时
                num3 = (num3 - 128) * 2 + 1;
            }else
            {
                num3 = num3 * 2; //当数小于 1000 0000 时
            }

        
        }
        printf("结果为：%d\n",num3);
    }
    else if (ch == 2)      //右移
    {
        for (round = 1; round <= count; round++) {
            if (num3%2 != 0) {
                num3 = (num3 / 2) + 128;
            }else
            {
                num3 = num3 / 2;
            }
        }
        printf("结果为：%d\n",num3);
        
    }
    else
    {
        printf("输入错误，请重新运行！");
    }
     
    
     //方法2
//    unsigned char num5;
//    printf("Please enter the number between 0 and 255 :");
//    
//    scanf("%d",&num5);
//    int direction = 0,digit = 0; //di.为移动方向  digit为移动位数
//    printf("请选择方向：\"左\"请输入1，\"右\"请输入2：");
//    scanf("%d",&direction);
//    printf("请输入移动位数：");
//    scanf("%d",&digit);
//    switch (direction) {
//        case 1:
//            num5 = (num5 << digit)|(num5 >>(8-digit));
//            printf("结果为：%d\n",num5);
//            break;
//        case 2:
//            num5 = (num5 >> digit)|(num5 <<(8 - digit));
//            printf("结果为：%d\n",num5);
//            break;
//        default:
//            break;
//    }
    
    
     
    
    
   /*
        //RGB转网页颜色
    int R = 0,G = 0,B = 0;
    printf("输入颜色R：G：B：");
    scanf("%d%d%d",&R,&G,&B);
    printf("网页颜色为#%x %0x %x",R,G,B);
    */
    
    
    
    return 0;
}

