//
//  student.c
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include "student.h"

Student maxOne(Student St[]){
    
    Student ageMin = {};
    Student scoreMax = {};
    ageMin = St[0];
    
    for (int i = 0; i < 3; i++) {
        
        if (St[i].score > scoreMax.score) {
            scoreMax = St[i];
        }
    }
    return  scoreMax;
    
    for (int i = 0; i < 3; i++) {
        
        if (St[i].age < ageMin.age) {
            ageMin = St[i];
        }
    }
    return ageMin;
}

void printStudent(Student stu){
    
    printf("%s分数最高,",stu.name);
    printf("分数为%.2f ",stu.score);
    printf("年龄为%d \n",stu.age);
    
}

void arrangement(Student St[]){
    Student temp = {};
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5 - i; j++) {
            if (St[j].score < St[j + 1].score ) {
                temp = St[j + 1];
                St[j + 1] = St[j];
                St[j] = temp;
            }
        }
    }

    
    for (int i = 0; i < 5; i++) {
        
        printf("%s,",St[i].name);
        printf("分数为%.2f ",St[i].score);
        printf("年龄为%d \n",St[i].age);
        
    }
//
//    temp2 = {St}
//    return temp2;
    
}

void printStudent2(Student St[]){
    
    for (int i = 0; i < 5; i++) {
        
    
    printf("%s分数最高,",St[i].name);
    printf("分数为%.2f ",St[i].score);
    printf("年龄为%d \n",St[i].age);
        
    }
    
}



