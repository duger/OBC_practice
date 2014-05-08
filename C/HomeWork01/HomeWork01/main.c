//
//  main.c
//  HomeWork01
//
//  Created by Duger on 13-8-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int maxanum(int a, int b)
{
    if (a > b){
        return a;
    }else
        return b;
}

int minanum(int a, int b)
{
    if (a < b){
        return a;
    }else
    {
        return b;
    }
    
}

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    //1.铁路托运行李规定：行李重不超过50公斤的，托运费按0.15元每公斤计算，如果超过50公斤，超出部分每公斤加收0.1元。编程实现上述功能。
    //方法一
 /*   float weigth = 0,price = 0;
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
    //方法二
    float weigth = 0,price = 0;
    int weigth2 = 0;
    printf("输入重量：");
    scanf("%f",&weigth);
    weigth2 = weigth + 0.99;
    if (weigth2 > 50) {
        price = 50 * 0.15 + 0.1 * (weigth2 - 50);    //
        printf("价格为：%.2f\n",price);
    }else
    {
        printf("价格为：%.2f\n",weigth2 * 0.15);
    }
    
    
    
    //2.编制一个完成两个数四则运算程序。如：用户输入34+56则输出结果为90.00，要求运算结果保留2位有效小数，用户输入时将2个运算数以及运算符都输入。根据运算符求结果
//    char ch;
//    float result = 0;
//    ch = getchar();
//    result = (float)ch;
//    printf("%.2f",result);
//    if (ch == '+') {
//    printf("abc");
//    }
  /*  int num2 = 0,num3 = 0;
    char ch;
    float result = 0;
    printf("Please enter your 式子：");
    scanf("%d%c%d",&num2,&ch,&num3);
    switch (ch) {
        case '+':
            printf("%d %c %d = %g",num2,ch,num3,(result = num2 + num3));
            break;
        case '-':
            printf("%d %c %d = %g",num2,ch,num3,(result = num2 - num3));
            break;
        case '*':
            printf("%d %c %d = %g",num2,ch,num3,(result = num2 * num3));
            break;
        case '/':
            printf("%d %c %d = %.3f",num2,ch,num3,(result =(float) num2 / (float)num3));
            break;
        default:
            printf("无法识别请重新输入");
            break;
    }
    */
    
    
    //3、有3个整数a,b,c，由键盘输入，输出其中最大的数。
   /* int a=0,b=0,c=0;
    printf("输入a: b: c: ");
    scanf("%d%d%d",&a,&b,&c);
    if (a > b && a > c) {
        printf("a最大，为：%d",a );
    }else if (b > c){
        if (a != b) {
            printf("b最大，为：%d",b);
        }else{
            printf("a与b都为最大值，为%d",b );
        }
        
    }else{
        if (a != c) {
            printf("c最大，为：%d",c);
        }else{
            printf("a与c都为最大值，为%d",c );
        }
    } */
    
    //4、有一个函数：x<1的时候，y = x；1<=x<10的时候，y=2x-1；x>=10的时候，y=3x-11。写一段程序，输入x，输出y值。
    /*float x = 0,y = 0;
    printf("请输入x:");
    scanf("%f",&x);
    if (x < 1) {
        y = x;
        printf("y = %g",y);
    }else if (x >= 10){
        y = 3 * x - 11;
        printf("y = %g",y);
    }else{
        y = 2 * x - 1;
        printf("y = %g",y);
    } */
    
    //6:编写一个程序， 确定一个数的位数：Enter a number:374   The number 374 has 3 digits
   /* int num1 = 0;
    printf("请输入：");
    num1 = sizeof(getchar());
    int ch = getchar();
    printf("The number %d has %d digits \n",ch,num1);
    */
    
    
//    long int num = 0,num1 = 0,num4 = 1,count = 0;
//    printf("Please enter the number:");
//    scanf("%ld",&num);
//    num1 = num;
//    while (num4 != 0) {
//        num4 = num / 10;
//        num = num4;
//        count += 1;
//    }
//    printf("The number %ld has %ld digits\n",num1,count);
    
    
    
    
    //7:编写一个程序，从用户输入的4个整数中找出最大值和最小值：Enter four intergers:21 43 10 35  Latest:43  Smallest:10    要求尽可能少用if语句
  /*
    //方法一
    int a = 0,b = 0,c = 0,d = 0;
    printf("Please enter the nums: ");
    scanf("%d%d%d%d",&a,&b,&c,&d);
    a > b ? (a > c ? (a > d ? printf("lagest:%d\n",a):printf("lagest:%d\n",d)):(c > d ? printf("lagest:%d\n",c):printf("lagest:%d\n",d))):(b > c ? (b > d ? printf("lagest:%d\n",b):printf("lagest:%d\n",d)):(c > d ? printf("lagest:%d\n",c):printf("lagest:%d\n",d)));
    
    a < b ? (a < c ? (a < d ? printf("smallest:%d\n",a):printf("smallest:%d\n",d)):(c < d ? printf("smallest:%d\n",c):printf("smallest:%d\n",d))):(b < c ? (b < d ? printf("smallest:%d\n",b):printf("smallest:%d\n",d)):(c < d ? printf("smallest:%d\n",c):printf("smallest:%d\n",d)));
    
    //方法二
    int a = 0,b = 0,c = 0,d = 0,max = 0, min = 0;
    
    printf("Please enter the nums: ");
    scanf("%d%d%d%d",&a,&b,&c,&d);
    
    max = ((a > b ? a : b) > c ? (a > b ? a : b) : c ) ? ((a > b ? a : b) > c ? (a > b ? a : b) : c ) : d ;
    min = ((a < b ? a : b) < c ? (a < b ? a : b) : c ) ? ((a < b ? a : b) < c ? (a < b ? a : b) : c ) : d ;
    
    printf("MAX: %d\n",max);
    printf("MIN: %d\n",min);
   */
   
    //方法三
    int a = 0,b = 0,c = 0,d = 0,max = 0, min = 0;
    
    printf("Please enter the nums: ");
    scanf("%d%d%d%d",&a,&b,&c,&d);
    
    max = maxanum(a, b);
    max = maxanum(max, c);
    max = maxanum(max, d);
    min = minanum(a, b);
    min = minanum(min, c);
    min = minanum(min, d);
    
    printf("最大值为：%d\n",max);
    printf("最小值为：%d\n",min);
     
 /*   //方法四
    int num5 = 0,max = 0,min = 0;
    
    printf("请输入第1个数：");
    scanf("%d",&max);
    min = max;
    for (int i = 2; i <= 4; i++) {
        printf("请输入第%d个数：",i);
        scanf("%d",&num5);
        max = maxnum(max, num5);
        min = minnun(min, num5);
        
    }
    
    printf("最大值为：%d\n",max);
    printf("最小值为：%d\n",min);
    */
    
    return 0;
}


