//
//  main.c
//  Tools
//
//  Created by Duger on 13-8-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    /*
     //RGB转网页颜色
     int R = 0,G = 0,B = 0;
     printf("输入颜色R：G：B：");
     scanf("%d%d%d",&R,&G,&B);
     printf("网页颜色为#%x %0x %x",R,G,B);
     */
    
    //二次方算数
    unsigned a = 0,b = 1;
    printf("输入2的几次方：");
    scanf("%d",&a);
    for (int i = 1; i <= a; i++) {
        b = b * 2;
    }
    
    printf("结果为：%d  ",b);
    return 0;
}

