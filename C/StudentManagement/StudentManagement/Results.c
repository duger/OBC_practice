//
//  Results.c
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "Results.h"


//3、某班5个学生，3门课，编写3个函数实现以下功能：
//（1）求各门课的平均分
Student2 averageResult(Student2 person){
    float sum = 0,average = 0;

    for (int i = 0; i < 3; i++) {
        sum += person.result[i];
    }
    average = sum / 3;
    person.average = average;
    return person;
}


//（2）找出三门都不及格的学生，输出其全部信息
void findBadboy(Student2 perss[]){
    printf("三门都不及格的同学为：\n");
    for (int i = 0; i < 5; i++) {
            if ((perss[i].result[0]<60 && perss[i].result[1] < 60 )&& perss[i].result[2] < 60) {
                printf("姓名：%s ",perss[i].name);
                printf("学号：%d ",perss[i].num);
                printf("数学：%.2f ",perss[i].result[0]);
                printf("语文：%.2f ",perss[i].result[1]);
                printf("英语：%.2f\n",perss[i].result[2]);
        }
        
    }
}


//（3）找出3门课平均分在80-90之间的学生，输出其信息。
void findgoodboy(Student2 perss[]){
    printf("80 - 90的同学为：");
    for (int i = 0; i < 5; i++) {
        if (perss[i].average < 90 && perss[i].average >80 ) {
            printf("姓名：%s ",perss[i].name);
            printf("学号：%d ",perss[i].num);
            printf("数学：%.2f ",perss[i].result[0]);
            printf("语文：%.2f ",perss[i].result[1]);
            printf("英语：%.2f\n",perss[i].result[2]);
        }
        
    }
}

