//
//  main.c
//  HomeWork11
//
//  Created by Duger on 13-8-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

#define FINDMAX(a, b ,c) (((a) > (b) ? (a) : (b)) > (c) ? ((a) > (b) ? (a) : (b)) : (c))

#define YIWEIFA(a) ((((a)<< 1) & (0b10101010101010101010101010101010))|(((a)>> 1) & (0b01010101010101010101010101010101)))

int main(int argc, const char * argv[])
{

  //  1、定义一个宏，求三个数的最大值
    int a = 5,b = 8 ,c =38,r = 0;
    r = FINDMAX(a,b,c);
    printf("最大值为：%d\n",r);
    
    
  //  2、定义一个宏，来实现一个整数奇偶比特位的交换。例如：6奇偶比特位交换后结果是9。如何用宏来实现？
    unsigned e = 1073741824 ,g = 0;
    g =  YIWEIFA(e);
    
    unsigned f = 0b10101010101010101010101010101010;
    printf("%d",g);
    
    
    return 0;
}

