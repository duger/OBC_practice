//
//  main.c
//  ClassDemo08
//
//  Created by Duger on 13-8-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#define MIN(A ,B ) (((A) < (B)) ? (A) : (B))

typedef struct people
{
    int num;
    char name[20];
    
}People;

void swap(int *x ,int *y){
    
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

void swap2(int x,int y)
{
    int *a = &x;
    int *b = &y;
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
int mysum1(int *x,int *y)
{
    int sum;
    sum = *x + *y;
    return sum;
}
void mysum2(int *x,int *y,int *sum)
{
    
    *sum = *x + *y;
    
}

int maxOne(int *x,int *y)
{
    return (*x > *y ? *x : *y);
}

void maxOne2(int *x,int *y,int *max)
{
    *max = (*x > *y ? *x : *y);
}

int theMaxOne(int a[],int n)
{
    int *p = a;
    int *max = p;
    for (int i = 0; i < n; i++) {
        if (*(p + i) > *max) {
            max = (p + i);
        }
    }
    return *max;
    
}

void ToZero(int a[],int n)
{
    int *q = a;
    for (int i = 0; i < n; i++) {
        if (*(q + i) > 27) {
            *(q + i) = 0;
        }
    }
}

void aToA(char chr[],int n,int count)
{
    int *count1 = &count;
    for (int i = 0; i < n; i++) {
        if (*(chr + i) == 'a') {
            *(chr + i) = 'A';
            count1++;
//            strcpy(*(chr + i), 'A');
        }
    }
    
    
}

int *creat_arr(int n ,int initial);

int main(int argc, const char * argv[])
{

//    People p1 = {01,"wanwan"};
//    People p2 = {02,"shasha"};
//    People *peo[2] ={&p1,&p2};
////    People *p = peo;
//    printf("%s\n",(**(peo + 1)).name);
//    printf("%s\n",(*(peo + 1) )-> name);
//    
//    
//    int x = 5, y = 7;
//    int *a = &x;
//    int *b = &y;
//    swap(a, b);
////    swap2(x, y);
//    printf("%d %d\n",x,y);
//    int max1,sum1;
//    int *sum = &sum1 ,*max = &max1 ;
//    max1 = maxOne(a, b);
//    maxOne2(a, b,max);
//    sum1 = mysum1(a, b);
//    mysum2(a,b,sum);
//    printf("和为%d\n",sum1);
//    printf("和为%d\n",*sum);
    
    
//    int (*p)[10] = malloc(sizeof(int) * 10);
//    
//    p = {5,45,6,4,8,3,7,18,5,23};
 
    
//    int max;
//    max = theMaxOne(a1, 10);
//    printf("%d\n",max);
//    
//    ToZero(a1, 10);
//    for (int i = 0; i < 10; i++) {
//        printf("%d ",a1[i]) ;
//    }
//    int count = 0;
//    
//    char chr[20] = "sioaininae";
//    aToA(chr,20,count);
//    printf("%s\n",chr);
    
//    int *p = malloc(10 * sizeof(int));
//    
//    
//    free(p);
//    p = NULL;
    
//    int (*p)[3] = (int (*)[])malloc(sizeof(int) * 2 * 3);
//    for (int i = 0; i < 2; i++) {
//        for (int j = 0; j < 3; j++) {
//            p[i][j] = arc4random()%100;
//        }
//    }
    
 /*   //malloc分配空间
    char *p = malloc(sizeof(char) * 10);
    strcpy(p, "sahala");
    printf("%s\n",p);
    
    
    
    //calloc分配空间
    
    int *p = calloc(5, sizeof(int));
    
  
    
    //realloc 改变已有的指针长度
    p = realloc(p, 6 * sizeof(int));
    
    //memset
    
    memset(p, 0x0, 6 * sizeof(int));
    
    //memcpy
    char *r = calloc(5, sizeof(char));
    char *q = "iphone";
    
    memcpy(r, "iphz" , 4);
    
    printf("%s\n",r);
    
    printf("%d\n",memcmp(r, q, 3));
 
    
    char *p = malloc(sizeof(char) * 10);
    memset(p, 0, sizeof(char) * 10);
    strcpy(p, "sahala");
    
    char *str = "jiwnwisjdndlawnwk";
    
    if (strlen(str) > (10 - 1)) {
        p = realloc(p, strlen(str) + 1);
    }
    
    strcat(p, str);
    printf("%s\n",p);
    free(p);

    strcpy(p, "dfefefsfe");
    printf("Wang%s\n",p);
    
    
    int str2[5] = {0};
    int *p2 ;
    p2 = creat_arr(5, 6);
    for (int i = 0; i < 5; i++) {
         printf("hahah%d\n",*(p2 + i));
    }
    
    
    
//    int a[4]={1,2,3,4};
//    int *ptr1=(int *)(&a+1);
//    int *ptr2=(int *)((int)a+1);
//    printf("%x,%x",ptr1[-1],*ptr2);
    
    bool var1 = 0;
    int var2 = 0;
    float var3 = 0;
    int *var4 = 0;
    
    if (!var1) {
        printf("var1");
    }
    if (0 == var2) {
        printf("var2");
    }
    if (-0.000001 < var3 && var3 < 0.000001) {
        printf("var3");
    }
    if (NULL == var4) {
        printf("var4");
    }
  
    int a3 = 3 ,b = 5,least = 0;
    int *p4 = &a3;
    printf("原%p\n",p4);
    least = MIN(*p4++, b);
    printf("%d\n",least);
    printf("后%p\n",p4);
    printf("%d\n",0x7fff5fbff894);
    printf("%p\n",p4 + 8);
    printf("%d\n",0x7fff5fbff8b4);
    printf("%d\n",0x7fff5fbff874);
    printf("%d\n",0x7fff5fbff88c);
    printf("%p\n",&a3);
  */
    
    int a = 0b1010000000000000;
    int b = 0b10000000000000000000000010100000;
    printf("%d\n",a);
    printf("%d\n",b);
    return 0;
}

int *creat_arr(int n ,int initial)
{
    int (*a)[n] = malloc(sizeof(int) * n);
    if (a == NULL) {
        return NULL;
    }
    for (int i = 0; i < n; i++) {
        (*a)[i] = initial;
    }
    return *a;
}

