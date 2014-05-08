//
//  main.c
//  test01
//
//  Created by Duger on 13-8-30.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define PERSON 20
#define SANWEISHU(N) ((N)%1000)



void randomNum(int *a,int n);

int split(int *a ,int low ,int high);
void quicksort(int *a,int low,int high);
void putInB(int *a,int *b,int n);
void lookDiffrent(int *b,int n);

int main(int argc, const char * argv[])
{

   /**************************************************************************************
    * 1、编写程序实现以下功能：                                                               *
    * 随机产生20个正整数存入数组a中，且每个数均在1000-9999之间（包含1000和9999）。                  *
    * 对数组进行排序，要求按每个数的后三位的大小进行升序排列，然后取出满足此条件的前10个数放入数组b中，    *
    * 如果后三位的数值相等，则按原先的数值进行降序排列。最后输出数组b的内容                            *
    *****************************************************************************************/                                                  

    int a[PERSON] = {0};
    

    
    randomNum(a, PERSON);
    printf("原数：\n");
    for (int i = 0; i < PERSON; i++) {
        printf("%d ",*(a + i));
    }
    printf("\n");
    
    quicksort(a, 0, 19);
    printf("排序后：\n");
    for (int i = 0; i < PERSON; i++) {
        printf("%d ",*(a + i));
    }
    printf("\n");
    
    int b[10] = {0};
 
    printf("B：\n");
    putInB(a, b, 10);
    for (int i = 0; i < 10; i++) {
        printf("%d ",*(b + i));
    }
    printf("\n");
    
    lookDiffrent(b, 10);
    printf("排序：\n");
    for (int i = 0; i < 10; i++) {
        printf("%d ",*(b + i));
    }
    
    return 0;
}


//产生随机数数组

void randomNum(int *a,int n)
{
    for (int i = 0; i < n; i++) {
        a[i] = (arc4random()%9000 + 1000);
    } 
}

//快速排序法
int split(int *a ,int low ,int high)
{
    int part_element = a[low];
    
    for (; ; ) {
        while (low < high && SANWEISHU(part_element) <= SANWEISHU(a[high])){
            high--;}
        if (low >= high)
            break;
        
        a[low++] = a[high];
        
        
        
        while (low < high && SANWEISHU(a[low]) <= SANWEISHU(part_element)){
            low++;}
        if (low >= high)
            break;
        
        a[high--] = a[low];
        
        
        
    }
    a[high] = part_element;
    return high;
    
    
}



void quicksort(int *a,int low,int high)
{
    int middle;
    
    if (low >= high) {
        return;
    }
    middle = split( a, low ,high);
    quicksort(a, low, middle - 1);
    quicksort(a , middle + 1, high);
}

//放入数组B

void putInB(int *a,int *b,int n)
{
    for (int i = 0; i < n; i++) {
        b[i] = a[i];
    }
}

//查相等 排列
void lookDiffrent(int *b,int n)
{
    int *c;
    
    int count = 0;
    int temp;
    for (int i = 0; i < n ;i++) {
        if(SANWEISHU(b[i + 1]) == SANWEISHU(b[i]) ) {
            c = b + i + 1;
            count++;
        }
        if (SANWEISHU(b[i - 1]) == SANWEISHU(b[i])) {
            for (int j = 0;j < count;j++) {
                for (int k = 0; k <= j; k++) {
                    if (*(c - count  + k) < *(c - count  + k + 1) ) {
                        temp = *(c - count  + k);
                        *(c - count  + k) = *(c - count  + k + 1);
                        *(c - count  + k + 1) = temp;
                    }
                
                
                }
            
            }
            count = 0;
        }
        
    }
    
    
    
    
}


