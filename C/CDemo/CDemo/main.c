//
//  main.c
//  CDemo
//
//  Created by Duger on 13-8-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
    //+= *= \= %=的用法
    int a = 2,b = 1,c = 1,d = 6,e = 9;
    b += a;
    c *= a;
    d /= a;
    e %= a;
    printf(" b = %d\n c = %d\n d = %d\n e = %d\n",b,c,d,e);
    
    int i = 3,k;
    //逐步取值和自增
    printf("%d,%d\n",(i++)+(i++)+(i++),i);
    
    i = 3;
    //逐步自增和取值
    printf("%d,%d\n",++i+(++i)+(++i),i);
    i = 3;
    k = i+++i+++i++;
    printf("%d,%d\n",k,i);
    
    //printf（）函数中的多输出项计算问题——自右向左
    i = 3;
    printf("%d,%d\n",i+2,i++);
    
    
    
    return 0;
}

