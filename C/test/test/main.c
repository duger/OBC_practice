//
//  main.c
//  test
//
//  Created by Duger on 13-8-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include <string.h>

#define OUT_NUM 3
#define ALL_NUM 13

struct {
    double i ;  
}sr;

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
  /*  double a = 2.73;
    int b = 0;
    b = (int)a ;
    printf("b = %d\n",b);
    
    
    float weigth = 0,price = 0;
    int weigth2 = 0;
    printf("输入重量：");
    scanf("%f",&weigth);
    if (((int)(weigth * 100))%100 != 0) { //确认保留两位小数，先*100，后对100取余，则这个数为weigth的小数，若没有则是整数。
        weigth2 = weigth + 1;             //若有小数 就进一
    }else
    {
        weigth2 = weigth;                 //强制转换int类型 去小数 无四舍五入
    }
    
    if (weigth2 > 50) {
        price = 50 * 0.15 + 0.1 * (weigth2 - 50);    //大于50KG的价格
        printf("价格为：%.2f",price);
    }else
    {
        printf("价格为：%.2f\n",weigth2 * 0.15);
    }
   */
    
    
//    int a = 0;
//    int b = 0;
//    int max = 0;
//    int min = 0;
//    
//    printf("输入两个数:");
//    scanf("%d %d",&a,&b);
//    
//    if (a < b) {
//        max = b;
//        min = a;
//    }else
//    {
//        max = a;
//        min = b;
//    }
//    
//    
//    
//    for (; 1; ) {
//        
//        if ((a % min == 0) && (b % min == 0)) {
//            printf("两数最大公约数为:%d\n",min);
//            break;
//        }
//        min--;
//    }
//    
//
//    
//    for (;1 ; ) {
//        
//        if (((max % a) == 0) && ((max % b) == 0)) {
//            printf("两数的的最小公倍数为:%d\n",max);
//            break;
//        }
//        max++;
//    }
//
//    printf("\a\a\a");
   
//    int a , b;
//    scanf("%d\n %d",&a,&b);
//    printf("a: %d\nb: %d\n",a,b);
    
//    int num = 534,a = 3,b = 24,c = 2011;
//    float unit = 35;
//    
//    printf("item,unit,date:\n");
////    scanf("%d%f%d%d%d",&num,&unit,&a,&b,&c);
//    printf("Ttem \tunit \tpurchase\n \t \tprice\tdate\n%-4d \t$%-7.2f \t%-2d/%-2d/%-4d\n",num,unit,a,b,c);
    
//    //scanf 在遇到不是对应类型时（除了空格）会停止 给下一个scanf识别
//    int a = 0 , c = 0 ;
//    char b = 0;
//    scanf("%d-",&a);
//    scanf("%c",&b);
//    scanf("%d",&c);
//    printf("%d\n",a);
//    printf("%c\n",b);
//    printf("%d\n",c);
//
//    printf("%6d,%4d\n",86,1040);
//    printf("%12.5e\n",30.253);
//    printf("%.4f\n",83.162);
//    printf("%-6.2g\n",.0000009979);
//    
//    float i , j;
//    int x;
//    scanf("%f%d%f",&i, &x, &j);
//    printf("%f\n%d\n%f\n",i,x,j);
    
//    int a , sum = 0;
//    for (a = 1; a <= 16; a++) {
//        sum += a;
//    }
//    printf("sum = %d",sum);
    
//    int people[ALL_NUM];
//    int pos, exit_num = ALL_NUM, step = 0;
//    
//    for(pos = 0; pos < ALL_NUM; pos++)
//        people[pos] = pos + 1;
//    
//    pos = 0;
//    
//    while(exit_num > 0)
//    {
//        if(people[pos])
//            step++;
//        if(people[pos] && step == OUT_NUM){
//            printf("%d out\n", people[pos]);
//            people[pos] = 0;
//            exit_num--;
//        }
//        pos++;
//        if(pos == ALL_NUM)
//            pos = 0;
//        if(step == OUT_NUM)
//            step = 0;
//    }
    
//    int a = 9,b = 0;
//    b = sqrt(a);
//    printf("%lu",sizeof(sr));
//    
//    OUT_NUM = 2;
    
    char a[10] = "abc";
    char b[10] ;
    strcat(a, "a");
    printf("%s\n",a);
    
    
    
    return 0;
}

