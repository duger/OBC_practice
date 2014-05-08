//
//  practice.c
//  HomeWork08
//
//  Created by Duger on 13-8-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "practice.h"
#include <string.h>

//  1、输入10个整数，将其中最小的数与第一个数对换，把最大的数和最后一个数对换，写3个函数：（1）输入10个数；（2）进行处理；（3）输出10个数。

void myScanf(int num[],int n)
{
    
    printf("10个数：");
    int *p = num;
       
    
    for (int i = 0; i < n; i++) {
    
            scanf("%d",(p + i));
    }
    
}

//void findMaxFindMin(int num[])
/*{
    int max = 0,maxPath = 0,minPath = 0,temp = 0;
    int min = num[1];
    for (int i = 0; i < 10; i++) {
        if (num[i] > max) {
            max = num[i];
            maxPath = i;
        }

    }
    temp = num[9];
    num[9] = num[maxPath];
    num[maxPath] = temp;
    
    
    for (int i = 0; i < 10; i++) {
            if (num[i] < min) {
            min = num[i];
            minPath = i;
        }

        
    }
    temp = num[0];
    num[0] = num[minPath];
    num[minPath] = temp;

} */
void findMaxFindMin(int num[],int n){
    int temp = 0 ;
    int *maxPath = num ,*minPath = num;
    for (int i = 0; i < n; i++) {
        if (*(num + i) > *maxPath) {
            maxPath = num + i;
        }
    }
    temp = *maxPath;
    *maxPath = *(num + n - 1);
    *(num + n - 1) = temp;
    
    for (int i = 0; i < n; i++) {
        if (*(num + i) < *minPath) {
            minPath = num + i;
        }
    }
    temp = *minPath;
    *minPath = *num;
    *num = temp;
    
    
}

void myPrintf(int num[],int n)
{
    printf("10个数为：");
    for (int i = 0; i < n; i++) {
        printf("%d ",num[i]);
    }
}

//2、在主函数中输入10个等长的字符串。用另一个函数对它们排序，然后在主函数输出10个已经排好的字符串。

void aToz(char *strings[])
{
    
    char *temp  ;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 9 - i; j++) {
            if (strcmp(*(strings + j), *(strings + j + 1)) > 0) {
                temp = *(strings + j);
                *(strings + j) = *(strings + j + 1);
                *(strings + j + 1) = temp;
            }
        }
    }
}



int clearNum(char *p)
{
    int n = (int)strlen(p);
    int m = 0;
    printf("%d\n",n);
    for (int i = 0; i < n - m; ) {
        if (*(p + i) >= '0' && *(p + i) <= '9') {
            
            m++;
            for (int j = i; j < n; j++) {
                *(p + j) = *(p + j + 1);
            }
            continue;
        }
        i++;
    }
    printf("%d\n",m);
    return n - m;
}
