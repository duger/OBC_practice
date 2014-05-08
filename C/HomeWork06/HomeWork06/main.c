//
//  main.c
//  HomeWork06
//
//  Created by Duger on 13-8-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "homeWork.h"

int main(int argc, const char * argv[])
{
/*    //2、自己实现strcpy函数
    char a[20] = "abcd",b[11] = {0};
    strcopy(b,  a);
    printf("%s\n",b);
    
    
    //3、自己实现strlen函数
    
    int i = strlenth(a);
    printf("%d\n",i);
    
    
    //4、写一个函数将 tom is cat 反向打印成 cat is tom
    char c[20] = "im a handsome boy";
    reverse(c );
    printf("%s\n",c);
    
    //5、预习结构体
    
    //    2、输入两个数，打印（printf）这两个数的和、差、积、商、以及余数。
    
    jjccy(4, 5);
    
    //4、企业面试题：
    //输入一个字节内的数（0~255）和移动位数。输出移位结果（要求循环移位）。
//    int num4 = 0;
//    printf("Please enter the number between 0 and 255 :");
//    
//    scanf("%d",&num4);
//    moveBit(num4);
    
    //    2、输入两个数，求最小公倍数和最大公约数。
    int num1 = 0 ,num2 = 0;
    printf("请输入两个数：");
    scanf("%d%d",&num1,&num2);
    divisor(num1, num2);
    
    //求S(n) = a+aa+aaa+aaaa+...+aa..a之值，其中a是一个数字，n表示a的位数例如：2+22+222+2222+22222(此时n=5)，n和a都从键盘输入。
    int a1 = 0 ,n = 0;
    printf("请输入a和n:");
    scanf("%d%d",&a1,&n);
    allIs2(a1, n );
    
    //    8、求1!+2!+3!+4!+..+n!
    int n = 0;
    printf("请输入n:");
    scanf("%d",&n);

    factorial(n);
 */   
    //    9、一个球从100m高度自由落下，每次落地后反跳回原来高度的一半，再落下，再反弹。求它在第 10次落地时，共经过多少米？第10次反弹多高？
    int h = 2300;
    ball(h);
    //随机产生20个[10 , 50]的正整数存到数组中，并求数组中的所有元素最大值、最小值、平均值以及各元素之和。
    int n = 0;
    printf("请输入：");
    scanf("%d",&n);
    mix(n);
    return 0;
}

