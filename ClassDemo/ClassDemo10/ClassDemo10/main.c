//
//  main.c
//  ClassDemo10
//
//  Created by Duger on 13-8-28.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int myMax(int x,int y)
{
    return x > y ? x : y;
}

char *inToChar(int i)
{
    return NULL;
}

void printName(void)
{
    
}

typedef int (*PFUN)(int ,int);

int sum(int x,int y)
{
    return x + y;
}

int func(int a ,int b ,PFUN p)
{
    return p(a,b);
}

int minGBS(int x, int y )
{
    return 111;
}

typedef struct
{
    char name[30];
    int age;
    int score;
}Students;

Students cat(Students stu)
{
    strcat(stu.name,"(月薪过万）");
    return stu;
}


void add$(Students stu[],int n,Students (*p)(Students))
{
    for(int i = 0; i < n ;i++){
        stu[i] = p(stu[i]);
    }
        
}


int main(int argc, const char * argv[])
{
/*
//    int m = 3, n = 5;
//    
//    int result = myMax(m , n);
//    
//    int (*p)(int ,int );          //指针函数
//    p = myMax;                    //函数首地址赋给指针
//    
//    int z = p(m ,n);
//    printf("%d\n",result);
//    printf("z is %d\n",z);
//    
//    
//    char *(*q)(int);
//    q = inToChar;  
//    
//    
//    void (*r)(void) = printName;
////    r = printName;
//    r();
//    
//    PFUN h = myMax;
//    h = sum;
//    
//    
//    
//    PFUN i = myMax;
//    i = minGBS;
//    int l = func(m, n, i );
  */  
    Students stu[3] = { {"wanna",23,89},{"shra",32,92},{"lasra",28,73}};
    
    Students temp[3] ;
    int j = 0;
    for (int i = 0; i < 3; i++) {
        if (stu[i].score > 90) {
            temp[j] = stu[i];
            j++;
        }
     }   
        
        Students (*p)(Students) = cat;
        add$(temp, j, p);
        
        printf("%d\n",j);
        for (int i = 0; i < j; i++) {
            printf("name = %s  age = %d  score = %d\n",temp[i].name,temp[i].age,temp[i].score);
        
    }
    
    
    return 0;
}

