//
//  main.c
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "student.h"
#include <string.h>
#include "Day.h"
#include "Candidate.h"
#include "Results.h"

int main(int argc, const char * argv[])
{

    Student stu1 = { "wangxiao",14,90};
    Student stu2 = { "fangfang",16,99};
    Student stu3 = { "mingming",15,95};
    Student stu4 = { "chaochao",18,80};
    Student stu5 = { "dabing",13,86};
    Student max = {};

    
    Student St[5] = {stu1,stu2,stu3,stu4,stu5};
    
    max = maxOne(St);
    printStudent(max);
    arrangement(St);
    
    
 //   1、定义一个结构体变量（包含年月日），计算该日在本年中为第几天？要求写一个days函数。参数是此结构体类型的变量，返回值是整数。
    Date date1 = {2013,8,22};
    int daysum =days(date1);
    printf("本年的 %d天！\n",daysum);
    
    
 //   2、模拟n个人参加选举的过程，四个候选人A、B、C、D。若选举某人直接输入其编号，最后按获得票数从高到低排序并输出候选人编号和票数。
    
    char a;
    printf("请输入候选人编号：");
    scanf("%c",&a);
    election(a);
    
    
    //   3、某班5个学生，3门课，编写3个函数实现以下功能：
  //  （1）求各门课的平均分
  //  （2）找出三门都不及格的学生，输出其全部信息
  //  （3）找出3门课平均分在80-90之间的学生，输出其信息。
    Student2 person1 = { 1,"haihai",23,{78,49,23},0};
    Student2 person2 = { 2,"lalala",23,{34,49,23},0};
    Student2 person3 = { 3,"tatata",23,{45,49,23},0};
    Student2 person4 = { 4,"kakbaza",23,{78,65,78},0};
    Student2 person5 = { 5,"sabila",23,{78,97,73},0};
    Student2 perss[5] ={person1,person2,person3,person4,person5};
    for (int i = 0; i < 5; i++) {
        perss[i] = averageResult(perss[i]);
        printf("%s的平均成绩为：%.2f\n",perss[i].name,perss[i].average);
    }
    
    
    printf("%s的平均成绩为：%.2f\n",perss[0].name,perss[0].average);
    
    findBadboy(perss);
    
    findgoodboy(perss);

    
    return 0;
}

