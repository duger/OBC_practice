//
//  main.c
//  HomeWork04
//
//  Created by Duger on 13-8-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define true 1
#define false 0

#define PERSON 13
#define STEP 3

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
//    //1、随机产生20个[10 , 50]的正整数存到数组中，并求数组中的所有元素最大值、最小值、平均值以及各元素之和。
//    int array1[20] = {0},max = 0 ,min = 60,sum = 0;
//    printf("数组为：");
//    for (int i = 0; i < 20; i++) {
//        array1[i] = arc4random()%40 + 10;
//        sum += array1[i];
//        printf("%d ",array1[i]);
//    }
//    for (int i = 0; i < 19; i++) {
//        max = (array1[i] < max ? max : array1[i]);
//        min = (array1[i] > min ? min : array1[i]);
//    }
//    printf("最大值：%d\n",max);
//    printf("最小值：%d\n",min);
//    printf("平均值：%d\n",sum / 20);
//    printf("总和：%d\n",sum);
//    
    //2、编程在一个已知的字符串中查找最长单词，假定字符串中只含字母和空格，用空格来分隔单词。
//    char strFir[40] = "dfi ersgdf dfwe   seeegeee err    ";
//    int count = 0 ,max1 = 0,path1 = 0 ,pathMax = 0;
//    unsigned long count2 = strlen(strFir);
//    printf("%lu\n",count2);
//    for (int i = 0 ; i < count2 ; i++  ) {
//        count++;
//        if (strFir[i] == ' ') {
//            count -= 1;
//            path1 = i;
//            printf("位置：%d ",path1 - count);
//            printf("count: %d  ",count);
//            printf("字符为：");
//            for (int j = path1 - count; j < path1; j++) {
//                printf("%c",strFir[j]);
//            }
//            printf("\n");
////            max1 = count > max ? count : max;
//            if (count > max1) {
//                max1 = count;
//                pathMax = path1;
////                printf("%d %d\n",max1 , pathMax);
//            }
//            count = 0;
//            
//        }
//                
//    }
//    if (path1 != count2 - 1) {
//        count = (int)count2 - path1;
//        if (count > max1) {
//            max1 = count;
//            pathMax = path1;
//            printf("最长单词位置：%d ",pathMax - max1);
//            printf("count: %d  ",max1);
//            printf("字符为：");
//            for (int j = pathMax - max1; j < pathMax; j++) {
//                printf("%c",strFir[j]);
//            }
//            printf("\n");
//        }
//    }
//    
//    printf("最长单词位置：%d ",pathMax - 1);
//    printf("count: %d  ",max1);
//    printf("字符为：");
//    for (int j = pathMax - max1; j < pathMax; j++) {
//        printf("%c",strFir[j]);
//    }

    //2013/8/19 作业3
    
//    int peoples[13]={1,2,3,4,5,6,7,8,9,10,11,12,13};
//    _Bool loop=true;
//    int nu=1,count=13,j=0;
//    int i;
//    while (loop) {
//        for(   i=0;i<count;i++){
//            if (count==1) {
//                  loop= false ;
//                    break;
//            }
//            if (nu==3) {
//                peoples[i]=0;
//                //printf(peoples,count);
//                printf("----%d---\n",count);
//                j=i;
//                while (j<count) {
//                    peoples[j]=peoples[j+1];
//                    j++;
//                }
//                count--;
//                nu=1;
//            }
//            nu++;
//            }
//        }
//        printf("\n%d",peoples[i]);

    
    int peoper[PERSON] = {0};
    int step = 0,person = 0,exitNum = PERSON;
    
    for (int i = 0 ; i < PERSON ; i++) {
        peoper[i] = i + 1;
    }
    
    while (exitNum > 0) {
        if (peoper[person] > 0) {
            step++;
        }
        
        if (peoper[person] > 0 && step == STEP) {
            exitNum--;
            printf("第 %d个人出列\n",peoper[person]);
            peoper[person] = 0;
            step = 0;
        }
        person++;
        if (person == PERSON) {
            person = 0;
        }
        
        
        
    }
    
    
    
    
    
    return 0;
}

