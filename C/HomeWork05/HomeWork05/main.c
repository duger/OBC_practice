//
//  main.c
//  HomeWork05
//
//  Created by Duger on 13-8-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define L 3
#define M 3
#define N 3

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
    //1、输入6个字符串，并对它们按从小到大的顺序排序后输出。
//    char str1[6][10] = {0},temp[10] = {0};
//    for (int i = 0; i < 6 ; i++) {
//        printf("请输入第 %d个字符串：",i + 1);
//        scanf("%s",str1[i]);
//    }
//    
//    for (int i = 0; i < 6; i++) {
//        for (int j = 0 ; j < 6 - i; j++) {
//            if (strcmp(str1[j], str1[j + 1]) > 0) {
//                strcpy(temp, str1[j]);
//                strcpy(str1[j], str1[j + 1]);
//                strcpy(str1[j + 1], temp);
//            }
//        }
//    }
//    
//    for (int i = 0; i < 6; i++) {
//        printf("%s\n",str1[i]);
//    }
    
    //2、随机生成一个三维数组，编程求深度的平均值，保存在一个二维数组中。
//    int a[L][M][N] = {0}, b[3][4] = {0};
//    int sum = 0;
//    
//    for (int i = 0 ; i < L; i++) {                  //产生随机数组
//        for (int j = 0 ; j < M; j++) {
//            for (int k = 0; k < N; k++) {
//                a[i][j][k] = arc4random()%10;
//            }
//        }
//    }
//    for (int i = 0; i < M; i++) {                   //产生平均值
//        for (int j = 0; j < N; j++) {
//            for (int k = 0; k < L; k++) {           //
//                sum += a[k][i][j];
//                
//            }
//            b[i][j] = sum / L;
//            sum = 0;
//        }
//        
//    }
//   
//    
//    for (int i = 0; i < L; i++) {                  //打印数组
//        for (int j = 0; j < M; j++) {
//            for (int k = 0; k < N ; k++) {
//                printf("%d \t",a[i][j][k]);
//            }printf("\n");
//        }printf("\n");
//    }
//    
//    printf("结果为：\n");
//    for (int i = 0; i < M; i++) {
//        for (int j = 0; j < N; j++) {
//                printf("%d \t",b[i][j]);
//          
//        }printf("\n");
//    }
    
    

    
    //3、找出一个二维数组中的“鞍点”，即该位置上的元素在该行中最大，在该列中最小（也可能没鞍点），打印出有关信息。
    int c[M][N] = {8,6,8,8,5,5,15,4,7},path[3] = {0};
    int max = 0 ,min = 30;
    
    
//    for (int i = 0 ; i < M ; i++) {             //随机产生
//        for (int j = 0 ; j < N; j++) {
//            c[i][j] = arc4random()%20;
//        }
//    }
    
    for (int i = 0; i < M; i++) {               //打印
        for (int j = 0; j < N; j++) {
            printf("%d \t",c[i][j]);
        }
        printf("\n");
    }
    
    for (int i = 0; i < M; i++) {           //求最大值
        for (int j = 0; j < N; j++) {
            if (c[i][j] > max) {
                max = c[i][j];
                path[0] = i;
                path[1] = j;
            }
        }
        
        printf("max%d %d  %d\n",path[0] + 1,path[1] + 1,max);
          
        for (int k = 0; k < M; k++) {
            
            if (c[k][path[1]] > min) {       //求最小值
                
                min = c[k][path[1]];
                path[2] = k;
            }
        }
        
        if(path[0] == path[2]){                                     //最大值为最小值
            printf("此为鞍点，坐标为：%d %d\n",path[0] + 1,path[1] + 1);
        }
        
        min = 30;
        max = 0;

    }
    
//    int number[3][4] = {8,6,8,1,8,5,4,1,15,4,6,1};//假定产生一个3x4的数组
////    for (int i = 0; i < 3; i ++) {//产生12个元素放到3x4的数组中，并且输出。
////        for (int j = 0; j < 4; j++) {
////            number[i][j] = arc4random()%100;
////            printf("%d\t",number[i][j]);
////        }
////        printf("\n");
////    }
//    
//    
//    int count  = 0;//鞍点个数
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0; j < 4; j++) {
//            int max = number[i][j];//让max先等于当前数字
//            int isMax = 1,isMin = 1;
//            for (int column = 0; column < 4; column++) {//让max和本行的每个数字比较，如果max<本行的其他数字说明这个数number[i][j]不是鞍点
//                if (max < number[i][column]) {
//                    isMax = 0;
//                    break;
//                }
//            }
//            if(isMax == 0){
//                continue;
//            }
//            int min = number[i][j];
//            for (int row = 0; row < 3; row ++) {//让min和本行的每个数字比较，如果min>本行的其他数字说明这个数number[i][j]不是鞍点
//                if (min > number[row][j]) {
//                    isMin = 0;
//                    break;
//                }
//            }
//            if (isMin == 0) {
//                continue;
//            }
//            
//            if (max == min) {
//                count ++;
//                printf("Saddlepoint number[%d][%d] = %d\n",i,j,number[i][j]);
//            }
//        }
//    }
//    
//    if (count == 0) {
//        printf("没有鞍点");
//    }

    
    
    
    
    return 0;
}

