//
//  homeWork.c
//  HomeWork06
//
//  Created by Duger on 13-8-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void strcopy(char chr1[],char chr2[]){
    for (int i = 0; 1; i++) {
        if (chr2[i] == '\0') {
            break;
        }
        chr1[i] = chr2[i];
    }
}

int strlenth(char chr1[]){
    int a = 0 ;
    for (int i = 0; 1; i++) {
        
        if (chr1[i] == '\0') {
            break;
        }
        a++;
    }
    return a;
}

void reverse(char chr1[]){
    char chr2[30] = {0};
    int space = 0,space2 = -1;
    int count = 0;

    space = (int)strlen(chr1);                      //字符串长度
    printf("spece %d\n",space);
    for (int j = space - 1,i = 0; j >= 0; j--,i++) {        //倒置字符串mot si tac
        chr2[i] = chr1[j];
    }

    printf("%s\n",chr2);
    
    for (int i = 0; i < space; i++) {
        
        if (chr2[i] == ' ') {                               //遇到空格倒置 空格前的一个单词
            for (int j = i - 1,k = space2 + 1; j > space2; j--,k++) {
                chr1[k] = chr2[j];
            }
            chr1[i] = ' ';
            space2 = i;
        }
        count++;
        
        if (count == space) {                           // 倒置最后的单词
            
            for (int j = i ,k = space2 + 1; j >= space2; j--,k++) {
                chr1[k] = chr2[j];
            }
            
        }
    }
    
}

//    2、输入两个数，打印（printf）这两个数的和、差、积、商、以及余数。

void jjccy(int num1,int num2)
{
//和
printf("num1 + num2 = %d\n",num1 + num2);
//差
printf("num1 - num2 = %d\n",num1 - num2);
//积
printf("num1 * num2 = %d\n",num1 * num2);
//商
printf("num1 / num2 = %.2f\n",(float)num1 / (float)num2);
//余数
printf("num1 %% num2 = %d\n",num1 % num2);
}


//4、企业面试题：
//输入一个字节内的数（0~255）和移动位数。输出移位结果（要求循环移位）。
void moveBit(unsigned char num5){
    
    
int direction = 0,digit = 0; //di.为移动方向  digit为移动位数
printf("请选择方向：\"左\"请输入1，\"右\"请输入2：");
scanf("%d",&direction);
printf("请输入移动位数：");
scanf("%d",&digit);
switch (direction) {
    case 1:
        num5 = (num5 << digit)|(num5 >>(8-digit));
        printf("结果为：%d\n",num5);
        break;
    case 2:
        num5 = (num5 >> digit)|(num5 <<(8 - digit));
        printf("结果为：%d\n",num5);
        break;
    default:
        break;
}
}

//    2、输入两个数，求最小公倍数和最大公约数。
//方法一
void divisor(int a , int b){
    int temp = 1,temp2 = 0;

    
    temp2 = a * b;              //最小公倍数 * 最大公约数
    //    printf("%d\n",a%b);

    do {
        
        temp = a%b;             //碾转反除法
        a = b;
        b = temp;               //交换值
    } while (temp != 0);

    printf("最大公约数为：%d\n",a);
    printf("最小公倍数是：%d\n",temp2 / a);
}

//    7、求S(n) = a+aa+aaa+aaaa+...+aa..a之值，其中a是一个数字，n表示a的位数例如：2+22+222+2222+22222(此时n=5)，n和a都从键盘输入。

void allIs2(int a ,int n){
unsigned long m = 0,num4 = 0, num5 = 1, sn = 0;

num4 = a;
for (int l = 1; l <= n ; l++) {
    
    
    for (m = 1; m <= l ; m++) {
        
        num5 = num5  * 10;
        
    }
    num4 = num5*a + num4;
    num5 = 1;
    printf("%ld\n",num4);
    sn = sn + num4;
    
}
printf("S = %ld\n",sn);
}

//    8、求1!+2!+3!+4!+..+n!

void factorial(int n){
    long int a = 0 ,b = 0 ,c = 1,sum = 0;
    for (a = 1; a <= n; a++) {      //20个数的循环
        for (b = 1; b <= a; b++) {   //每个数的相乘循环 1*2*3*4
            c = c * b;

        }
        sum = sum + c;               //数相加
        c = 1;                       //重置没个数相乘的初始数为1
        printf("sum: %ld\n",sum);
    }
    printf("结果：%ld\n",sum);
}

//    9、一个球从100m高度自由落下，每次落地后反跳回原来高度的一半，再落下，再反弹。求它在第 10次落地时，共经过多少米？第10次反弹多高？
void ball(float h){
    float s = 0;
    int t = 0;
    printf("输入次数t：");
    scanf("%d",&t);
    s = 100;
    for (int i = 1; i <= t; i++) {
        
        s = s + 2*h;
        h = h / 2;
        
    }
    printf("h = %f\n",h);
    printf("s = %f\n",s);
}

    //1、随机产生20个[10 , 50]的正整数存到数组中，并求数组中的所有元素最大值、最小值、平均值以及各元素之和。

void mix(int m){
    int array1[300] = {0},max = 0 ,min = 60,sum = 0;
    printf("数组为：");
    for (int i = 0; i < m; i++) {
        array1[i] = arc4random()%40 + 10;
        sum += array1[i];
        printf("%d ",array1[i]);
    }
    for (int i = 0; i < m - 1; i++) {
        max = (array1[i] < max ? max : array1[i]);
        min = (array1[i] > min ? min : array1[i]);
    }
    printf("最大值：%d\n",max);
    printf("最小值：%d\n",min);
    printf("平均值：%d\n",sum / 20);
    printf("总和：%d\n",sum);
}
