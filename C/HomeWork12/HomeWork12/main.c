//
//  main.c
//  HomeWork12
//
//  Created by Duger on 13-8-28.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdbool.h>



#define STUDENTNUM 3
typedef struct
{
    char name[20];
    int age;
    int score;
}Students;

typedef bool (*chose)(Students,Students);

typedef struct
{
    char laber[10];
    chose p;
}FunBrother;



//bool
bool compAge(Students stu1,Students stu2)
{
    return (stu1.age > stu2.age);
}

bool compName(Students stu1,Students stu2)
{
    return (strcmp(stu1.name, stu2.name));
}
bool compScore(Students stu1,Students stu2)
{
    return (stu1.score > stu2.score);
}

FunBrother funFamily[3] = {{"age",compAge},{"name",compName},{"score",compScore}};

void compare(Students stu[],int n,char *shr)
{
    chose p = NULL;
    for (int i = 0; i < n; i++) {
        if (strcmp(funFamily[i].laber, shr) == 0) {
            p = funFamily[i].p;
        }
    }
    
    Students temp;
    for (int i = 0; i < n-1; i++) {
        for (int j = 0; j < n - i-1; j++) {
            
            if (p(stu[j],stu[j + 1])) {
                temp = stu[j + 1];
                stu[j + 1] = stu[j];
                stu[j] = temp;
            }
        }
    }
}

//
//void scoreMaxToMin(Students stu[],int n)
//{
//    Students temp;
//    for (int i = 0; i < n-1; i++) {
//        for (int j = 0; j < n - i-1; j++) {
//            
//            if (stu[j].score > stu[j + 1].score) {
//                temp = stu[j + 1];
//                stu[j + 1] = stu[j];
//                stu[j] = temp;
//            }
//        }
//    }
//}
//
//void ageMaxToMin(Students stu[],int n)
//{
//    Students temp ;
//    for (int i = 0; i < n-1; i++) {
//        for (int j = 0; j < n - i-1; j++) {
//            
//            if (stu[j].age > stu[j + 1].age) {
//                temp = stu[j + 1];
//                stu[j + 1] = stu[j];
//                stu[j] = temp;
//            }
//        }
//    }
//}
//
//void nameMaxToMin(Students stu[],int n)
//{
//    Students temp ;
//    for (int i = 0; i < n-1; i++) {
//        for (int j = 0; j < n - i-1; j++) {
//            if (strcmp(stu[j].name, stu[j + 1].name)  > 0) {
//                temp = stu[j + 1];
//                stu[j+ 1] = stu[j];
//                stu[j] = temp;
//            }
//        }
//    }
//}




//bool comp2(int j,char *str)
//{
//    Students temp;
//    if (str == ) {
//        
//    }
//}

typedef void (*PFUN)(Students stu[],int n);


int main(int argc, const char * argv[])
{
    Students stu[3] = { {"wanna",23,89},{"shra",32,92},{"lasra",28,73}};
/*    printf("按分数：\n");
//    scoreMaxToMin(stu, 3);
//    for (int i = 0; i < 3; i++) {
//        printf("名字：%s 年龄： %d 分数： %d\n", stu[i].name, stu[i].age,stu[i].score );
//    }
//    printf("按年龄：\n");
//    ageMaxToMin(stu, 3);
//    for (int i = 0; i < 3; i++) {
//        printf("名字：%s 年龄： %d 分数： %d\n", stu[i].name, stu[i].age,stu[i].score );
//    }
//    printf("按姓名：\n");
//    nameMaxToMin(stu, 3);
//    for (int i = 0; i < 3; i++) {
//        printf("名字：%s 年龄： %d 分数： %d\n", stu[i].name, stu[i].age,stu[i].score );
   }
*/ 
    compare(stu, 3, "age");
    for (int i = 0; i < 3; i++) {
        printf("名字：%s 年龄： %d 分数： %d\n", stu[i].name, stu[i].age,stu[i].score );
    }

    
    
    return 0;
}

