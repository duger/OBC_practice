//
//  main.c
//  ClassDemo06
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

struct student {
    
    char name[20];
    int age;
    float score;
    
};

    typedef struct student student;

struct people{
    int age;
    char sex;
    char name[20];
};



typedef struct people People;

int main(int argc, const char * argv[])
{
    
    
    typedef struct student student;
     
       
    
    People p1 = {23,'b',"xiaofeng"};
    People p2 = {23,'g',"xiaofan"};
    
    p1 = p2;
    
    printf("%d %c %s\n",p1.age,p1.sex,p1.name);
    printf("%d %c %s\n",p2.age,p2.sex,p2.name);
    
    int a[5] = {1,2,3,4,5};
    int b[5] = {0};
    
    struct student stu1 = { "wangxiao",14,90};
    struct student stu2 = { "fangfang",16,99};
    struct student stu3 = { "mingming",15,95};
    
    struct student St[3] = {stu1,stu2,stu3};
    int max = 0,num1 = 0, min = 200,num2 = 0;
    for (int i = 0; i < 3; i++) {
        
            if (St[i].score > max) {
                max = St[i].score;
                num1 = i;
           
        }
    }
    printf("%s分数最高\n",St[num1].name);
    
    for (int i = 0; i < 3; i++) {
        
        if (St[i].age < min) {
            min = St[i].age;
            num2 = i;
            
        }
    }
    printf("%s年龄最小\n",St[num2].name);
    
    student ageMin = {};
    student scoreMax = {};
    ageMin = St[0];
    
    for (int i = 0; i < 3; i++) {
        
        if (St[i].score > scoreMax.score) {
            scoreMax = St[i];
            
            
        }
    }
    printf("%s分数最高\n",scoreMax.name);
    
    for (int i = 0; i < 3; i++) {
        
        if (St[i].age < ageMin.age) {
            ageMin = St[i];
            
        }
    }
    printf("%s年龄最小\n",ageMin.name);
    
    
    
    return 0;
}

