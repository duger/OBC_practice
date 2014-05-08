//
//  main.c
//  HomeWork09
//
//  Created by Duger on 13-8-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>

typedef struct student
{
    int num;
    char name[20];
    int score;
}Student;

void studentA(Student a[],int n)
{
    Student *p =a;
//    char b[10];
    for (int i = 0 ; i < n; i++) {
        if ((*(p + i)).score > 90 ) {
//            *b = *(*(p + i)).name;
            strcat((*(p + i)).name,"A");
        }
    }
}

void studAToZ(Student a[],int n)
{
    Student *p = a;
    Student temp;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i; j++) {
            if (strcmp((*(p + j)).name, (*(p + j + 1)).name) > 0) {
                temp = *(p + j);
                *(p + j) = *(p + j + 1);
                *(p + j + 1) = temp;
            }
        }
    }
    
}

void maxToMin(int a[],int n)
{
    int temp;
    int *p = a;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i; j++) {
            if (*(p + j) > *(p + j + 1)) {
                temp = *(p + j);
                *(p + j) = *(p + j + 1);
                *(p + j + 1) = temp;
            }
        }
    }
}

void order_1(int *a[],int n)
{
    int temp;
    for (int i = 0; i < n-1; i++) {
        for (int j = 0; j < n-1-i; j++) {
            if (**(a+j)>**(a+j+1)) {
                temp = **(a+j);
                **(a+j) = **(a+j+1);
                **(a+j+1) = temp;
            }
        }
    }
}


int main(int argc, const char * argv[])
{

 //   有5个学生，将成绩在90分以上的标记为优，即姓名后面加(A)
    
    Student s1 = {01,"hala",89};
    Student s2 = {02,"sara",93};
    Student s3 = {03,"faba",59};
    Student s4 = {04,"kaka",80};
    Student s5 = {05,"yaha",97};
    
    Student stds[5] = {s1,s2,s3,s4,s5};
    studentA(stds, 5);
    printf("%s\n",stds[0].name);
    
    
    
   
//    1、主函数创建5个学生的数组，写一个排序函数，让学生按姓名从小到大排序，主函数输出排序后的结果
    studAToZ(stds, 5);
    for (int i = 0; i < 5; i++) {
        printf("%d %s %d\n",stds[i].num,stds[i].name,stds[i].score);
    }
    
    
//    2、写一个整型数组排序的函数，并测试效果
//    int a[10] = {5,3,6,2,34,7,9,45,32,10};
//    maxToMin(a, 10);
//    for (int i = 0; i < 10; i++) {
//        printf("%d ",a[i]);
//    }
    int (*p)[10] = malloc(sizeof(int) * 10);
    int a[6] = {12,34,56,78,42,66};
    
    int *a1 = a;
    order_1(&a1, 6);
    
    for (int i = 0; i < 6; i++) {
        printf("%d\n",*(a + i));
    }

    
//    3、预习动态内存分配

    
}

