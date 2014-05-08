//
//  main.c
//  test04
//
//  Created by Duger on 13-8-30.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

typedef struct
{
    int _ID;
    int age;
    char sex;
    char name[20];
    int math;
    int eng;
    
}Student;

typedef bool (*chose)(Student,Student);


typedef struct
{
    char laber[10];
    chose p;
}CompareTip;

bool compID(Student stu1,Student stu2)
{
    return (stu1._ID > stu2._ID);
}

bool compAge(Student stu1,Student stu2)
{
    return (stu1.age > stu2.age);
}

bool compName(Student stu1,Student stu2)
{
    return (strcmp(stu1.name, stu2.name));
}
bool compMath(Student stu1,Student stu2)
{
    return (stu1.math > stu2.math);
}

CompareTip comparetips[4] = {{"ID",compID},{"age",compAge},{"name",compName},{"math",compMath}};

void compare(Student stu[],int n,char *shr)
{
    chose p = NULL;
    for (int i = 0; i < n; i++) {
        if (strcmp(comparetips[i].laber, shr) == 0) {
            p = comparetips[i].p;
        }
    }
}
    
//    Student temp;
//    for (int i = 0; i < n-1; i++) {
//        for (int j = 0; j < n - i-1; j++) {
//            
//            if (p(stu[j],stu[j + 1])) {
//                temp = stu[j + 1];
//                stu[j + 1] = stu[j];
//                stu[j] = temp;
//            }
//        }
//    }
//}


//以
//Student maxOne(Student St[]){
//    
//    Student ageMin = {};
//    Student scoreMax = {};
//    ageMin = St[0];
//    
//    for (int i = 0; i < 3; i++) {
//        
//        if (St[i].math > scoreMax.math) {
//            scoreMax = St[i];
//        }
//    }
//    return  scoreMax;
//    
//    for (int i = 0; i < 3; i++) {
//        
//        if (St[i].age < ageMin.age) {
//            ageMin = St[i];
//        }
//    }
//    return ageMin;
//}

void printStudent(Student stu[])
{
    for (int i = 0; i <3 ; i++) {
        
    
    printf("*********************\n");
    printf("ID：%d   ",stu[i]._ID);
    printf("姓名：%s\n",stu[i].name);
    printf("性别：%c  ",stu[i].sex);
    printf("年龄：%d\n",stu[i].age);
    printf("数学分数为%d ",stu[i].math);
    printf("英语分数为%d \n",stu[i].eng);
    
        }
}

//void Math(Student St[]){
//    Student temp = {};
//    for (int i = 0; i < 5; i++) {
//        for (int j = 0; j < 5 - i; j++) {
//            if (St[j].math < St[j + 1].math) {
//                temp = St[j + 1];
//                St[j + 1] = St[j];
//                St[j] = temp;
//            }
//        }
//    }
//    
//    
//    for (int i = 0; i < 5; i++) {
//        
//        printStudent(St[i]);
//        
//    }
//    
//    
//}



int main(int argc, const char * argv[])
{

    /*
     4、用结构体数组实现学生学籍管理，记录信息有学生ID、年龄、性别、姓名、数学、英语成绩，并以ID为关键字进行排序考查知识点：数组、结构体、输入输出、循环体、模块设计，要求：正确输入输出各种数据、函数设计结构合理。
     */
    
    Student stus[3] = {{01,23,'f',"shara",89,74},{02,33,'f',"tsria",84,94},{03,26,'m',"barara",56,89}};
    
    compare(stus,3,"ID");
    
    printStudent(stus);
    printf("*********************");
    
    
    return 0;
}

