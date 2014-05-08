//
//  main.c
//  ClassDemo02
//
//  Created by Duger on 13-8-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
 /*
    //关系运算符 >  <  >=  <=  == !=
    //&& || !
    
    int a = 1;
    int b = 2;
    int c = 0;
    
    c = a > b;
    printf("c = %d\n",c);
    
    c = a == b;
    
    printf("C = %d\n",c);
    
    int d = 10;
    int e = 20;
    int f = 30;
    
    c = (f >= d && f <= e);
    printf("c = %d\n",c);
    
    //逻辑运算符的短路
    
    c = (d || e++);          //因为是或运算  d为非0后，就不运行和判断后面的e++了

    printf("c = %d e = %d\n",c,e);
    
    
    int a =1;
    int b = 3;
    
    if (a - b) {
        printf("当不为0时就显示");
    }
    
    if (a > b) {
        printf("a 大于 b\n");
    }else if (a < b)
    {
        printf("a 小于 b\n");
    }else if (a == b)
    {
        printf("a 等于 b\n");
    }
    
    int x = 6;
    int y = 0;
    if ( y != 0) {
        printf(" x / y = %d\n",x / y );
    }
    
    if (0)
        printf("运行我吗！");
        if (1)
            printf("我是里面的！\n");
        else
            printf("我是谁的呢！");
    
    
    int hua = 0, num1 = 0 ,hp = 0;
    printf("请输入花色黑桃为1 ，红桃为2 ，方片为3，梅花为4；和你的点数：");
    scanf("%d%d",&hua,&num1);
    printf("请输入您当前的血量！：");
    scanf("%d",&hp);
    if (hua == 1 && (num1 >= 2 && num1 <= 9)) {
        hp = hp - 3;
        if (hp > 0) {
            printf("很不幸！您今儿脸黑！HP = %d\n",hp);
        }else
            printf("你死了！！！哪凉快哪儿呆着去吧！\n");
        
    }else
        printf("滚犊子，你丫竟然没被劈中！HP = %d\n",hp);
    
    
    
    int year = 0;
    printf("请输入年份：");
    scanf("%d",&year);
    if (year%400 == 0 || (year % 4 == 0  && year % 100 != 0) ) {
        printf("%d为闰年！\n",year);
        
    }else
        printf("%d不是闰年！\n",year);
    
    float price = 0;
    printf("输入金额：");
    scanf("%f",&price);
    if (price > 500) {
        price = (price - 500)*0.9 + 500;
        printf("收款：%.2f\n",price);
    }else
    printf("收款：%.2f\n",price);
    
    char ch;
    printf("请输入一个字符！");
    scanf("%c",&ch);
    if (ch >= 48 && ch <= 57) {
        printf("this isdigital");
    }else if(ch >= 65 && ch <= 90)
    {
        printf("this is letter");
    
    }else if(ch >= 97 && ch <= 122)
    {
        printf("this is capital letter");
    }else
        printf("other");
  
  */
    int a = 0;
    printf("请输入数：");
    scanf("%d",&a);
    
    switch (a) {
        case 1:
            printf("你输入的是：1");
            break;
        case 2:
            printf("你输入的是：2");
            break;
        case 3:
            printf("你输入的是：3");
            break;
        case 4:
            printf("你输入的是：4");
            break;
        case 5:
            printf("你输入的是：5");
            break;
        default:
            printf("你输入的是1 - 5以外的数");
            break;
    }
    
    return 0;
}

