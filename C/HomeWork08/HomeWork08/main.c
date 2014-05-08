//
//  main.c
//  HomeWork08
//
//  Created by Duger on 13-8-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "practice.h"

int main(int argc, const char * argv[])
{

  //  1、输入10个整数，将其中最小的数与第一个数对换，把最大的数和最后一个数对换，写3个函数：（1）输入10个数；（2）进行处理；（3）输出10个数。
//    int num[5] = {0};
//    myScanf(num,5);
//    
//    findMaxFindMin(num,5);
//    myPrintf(num,5);
    
    
    
 //   2、在主函数中输入10个等长的字符串。用另一个函数对它们排序，然后在主函数输出10个已经排好的字符串
    
    char *strings[10] = {"weidjf","dfofrn","djklps","kfjsjd","aqeort","orutye","ofjklm","piojas","qywter","yuiops"};
    aToz(strings);
    for (int i = 0; i < 10; i++) {
        printf("%s\n",*(strings + i));
        
    }

  //  有一字符串，包含数字与字母，编程去除数字。
 //   1、要求在原字符串中操作
  //  2、使用指针处理。
    
    char string1[20] = "fjie3i38fd39dfe";
    char *ph = string1;
    
    int num = clearNum(ph);
    
    for (int i = 0; i < 20 - num; i++) {
        printf("%c",string1[i]);
    }
    
    return 0;
}

