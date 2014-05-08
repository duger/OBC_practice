//
//  main.c
//  ClassDemo4
//
//  Created by Duger on 13-8-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define M 3
#define N 4

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
//    char str[] = {'i', 'p','h','o','n','e','5'};
//    printf("%c\n",str[4]);
//    
//    int array[10] = { 3,35,34,63,35,34,2,4,5,6};
//    printf("%d\n",array[4]);
//    array[4] = 5;
//    printf("%d\n",array[4]);
//    
//    printf("%zu\n",10 * sizeof(int));
//    printf("%ld\n",10 * sizeof(int));
    
//    int array1[20],sum = 0 ;
//    srand((unsigned)time(NULL));
//    for (int i = 0; i <= 19; i++) {
//        array1[i] = (arc4random()%40 + 30);
//        sum += array1[i];
//        printf("arrary[%d] = %d\n",i,array1[i]);
//    }
//    printf("sum = %d\n",sum);
//    
//    int array2[10] , array3[10],array4[10];
//    for (int i = 0; i < 10; i++) {
//        array2[i] = arc4random()%20 + 20;
//        array3[i] = arc4random()%20 + 20;
//        array4[i] = array2[i] + array3[i];
//        printf("array2[%d]: %d + array3[%d]: %d = array[%d] : %d\n",i ,array2[i],i,array3[i],i ,array4[i]);
//    }
    
//    int array2[10] = { 4, 6,2,1,8,9,3,10,18,11},i = 0,temp1 = 0;
//    for (int j = 9; j >= 0; j--) {
//        
//        for (i = 0,temp1 = 0; i < j; i++) {
//            
//            //三目法
////            temp1 = array2[i + 1] + array2[i];
////            array2[i + 1] = ((array2[i + 1] < array2[i]) ? array2[i + 1] : array2[i]);
////            array2[i] = temp1 - array2[i + 1];
//            
//            //if法
//            if (array2[i + 1] < array2[i]) {
//                temp1 = array2[i];
//                array2[i] = array2[i + 1];
//                array2[i + 1]  = temp1;
//            }
//        } 
//        
//    }
//    for (i = 0; i <= 9; i++) {
//        printf("%d ",array2[9 - i]);
//    }
//    
//    
//    char str[10] = {'i','p','h','o','n','e'};
//    char str_1[10] = "hphone";
//    char str_2[10] ={0};
//    char str_3[10] = "abc";
//    
//    //strlen strcpy strcat strcmp
//    
//    unsigned long longth = strlen(str);
//    
//    printf("len = %lu\n",longth);
//    strcpy(str_2, str_1);
//    printf("str_2 = %s\n",str_2);
//    
//    strcat(str_2, str_3);
//    printf("str_3 : %s\n",str_2);
//    
//    int a = strcmp(str, str_1),temp2 = 0;
//    printf("a = %d\n",a);
//    
//    char str_4[100] = "I love iOS,i want an iPhone5",c = 0;
//    
//
//    
//    for (int i = 0; i <= 100; i++) {
//        if (str_4[i] == 32) {
//            temp2 += 1;
//        }
//        
//    }
//    printf("temp2 :%d\n",temp2);
    
    int a[3][2] = {
        {1 , 2} ,
        {2 , 4} ,
        {3 , 5}};
    
//    for (int i = 0 ; i < 3; i++) {
//        for (int j = 0 ; j < 2; j++) {
//            printf("a[%d][%d] = %d\t",i ,j ,a[i][j]);
//            }
//    }
    
//    int b[5][5] = {0};
//    for (int i = 0; i < 5; i++) {
//        for (int j = 0 ; j < 5; j++) {
//            b[i][j] = arc4random()%30;
//            printf("%d\t",b[(i)][(j)]);
//        }
//        printf("\n");
//    }
//    printf("\n");
//    for (int i = 0; i < 5; i++) {
//        for (int j = 0 ; j < 5; j++) {
//            printf("%d\t",b[(4 - i)][(4 -j)]);
//        }
//        printf("\n");
//    }
//    printf("\n");
//    
//    
//    int c[3][2] = {1,3,5,6,7,8},d[2][3] = {0};
//    for (int i =0 ; i < 3; i++) {
//        for (int j = 0; j < 2; j++) {
//            printf("%d\t",c[i][j]);
//            d[j][i] = c[i][j];
////            printf("%d\t",d[)
//        }
//        printf("\n");
//    }
//    printf("\n");
//    for (int j = 0; j < 2; j++) {
//        for (int i = 0; i < 3; i++) {
//            printf("%d\t",d[j][i]);
//        }
//        printf("\n");
//    }
//    printf("\n");
//
//    
//    int e[3][4] = {0},f[2] = {0};
//    int max = 0;
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0 ; j < 4; j++) {
//            
//            e[i][j] = arc4random()%40;         //产生随机数
//            printf("%d\t",e[i][j]);
//            
//            if (e[i][j] > max) {            //记录最大值
//                max = e[i][j];
//                f[0] = i;
//                f[1] = j;
//            }
//           
//        } printf("\n");
//        
//    }
//    printf("位置为%d %d max = %d\n",f[0] + 1,f[1] + 1,max);
//    
//    char strings[3][10] = {"iphone","android","winphone"};
//    
//    printf("%c\n",strings[0][2]);
//    
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0; j < 10; j++) {
//            printf("%c\t",strings[i][j]);
//        }
//        printf("%s\n",strings[i]);
//    }
    
    //求输入三个字符串 ，求最长的！！
//    char stringFir[3][11] = {0};
//    unsigned long max = 0;
//    int path = 0;
//    
//    for (int k = 0; k < 3; k++) {
//        printf("输入第%d个字符串：",k+1);
//        scanf("%s",stringFir[k]);
//    }
//    
//    for (int i = 0 ; i < 3; i++) {
//        if (strlen(stringFir[i]) > max) {
//            max = strlen(stringFir[i]);
//            path = i;
//        }
//    }
//    
//    printf("最长的是：%s\n",stringFir[path]);
//    printf("长度为 = %lu\n",max);
    
    
    //人名儿排序
    //冒泡法
//    char nameLine[10][10] = {"dfoen","canme","nadegg","dain","dinne","onlihien","nieng","isnin","unin","meona"};
//    char temp[10];
//    for (int i = 0; i < 10; i++) {
//        for (int j = 0; j < 10 - i; j++) {
//
//            if (strcmp(nameLine[j], nameLine[j + 1]) > 0) {
//                strcpy(temp, nameLine[j + 1]);
//                strcpy(nameLine[j + 1], nameLine[j]);
//                strcpy(nameLine[j], temp);
//                }
//        }
//    }
//    
//    for (int i = 0; i < 10; i++) {
//        
//            printf("%s\n",nameLine[i]);
//        
//    }
//    
//    int arr[2][3][4] = {
//        {
//            {3,536,45,4},
//            {3,35,1,2},
//            {56,8,9,4}
//        },
//        {
//            {3,536,45,4},
//            {3,35,1,2},
//            {56,8,9,4}
//        }
//    };
//    
//    for (int i = 0; i < 2; i++) {
//        for (int j = 0; j < 3; j++) {
//            for (int k = 0; k < 4 ; k++) {
//                printf("%d \t",arr[i][j][k]);
//            }printf("\n");
//        }printf("\n");
//    }
    
    //3、找出一个二维数组中的“鞍点”，即该位置上的元素在该行中最大，在该列中最小（也可能没鞍点），打印出有关信息。
    int c[3][4] = {0},path[3] = {0};
    int max = 0 ,min = 30;
    
    for (int i = 0 ; i < 3; i++) {             //随机产生
        for (int j = 0 ; j < 4; j++) {
            c[i][j] = arc4random()%20;
        }
    }
    
    for (int i = 0; i < 3; i++) {               //打印
        for (int j = 0; j < 4; j++) {
            printf("%d \t",c[i][j]);
        }
        printf("\n");
    }
    
    for (int i = 0; i < 3; i++) {           //求最大值
        for (int j = 0; j < 4; j++) {
            if (c[i][j] > max) {
                max = c[i][j];
                path[0] = i;
                path[1] = j;
            }
        }
        
        printf("max%d %d  %d\n",path[0] + 1,path[1] + 1,max);
        
        for (int k = 0; k < 3; k++) {
            
            if (c[k][path[1]] < min) {       //求最小值
                min = c[k][path[1]];
                path[2] = k;
            }
        }
        
        //        printf("min = %d\n",min);
        
        if(path[0] == path[2]){                                     //最大值为最小值
            printf("此为鞍点，坐标为：%d %d\n",path[0] + 1,path[1] + 1);
        }
        
        min = 30;
        max = 0;
    }

        
    return 0;
}

