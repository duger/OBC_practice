//
//  main.c
//  QuickTest
//
//  Created by Duger on 13-8-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "works.h"
#include <string.h>

#define PI 3.1415926

#define SQR(X) X*X

char A_to_a(char a)
{
    if (a >= 'A' && a <= 'Z') {
        return a + 32;
    }else{
        printf("您输入的不是A-Z的字符，请重新运行！");
    }
    
}

void print_segment(void)
{
    printf("**************************\n");
}



int main(int argc, const char * argv[])
{
//    int a;
//    char b;
//    float c;
    
//    printf("输入字符：");
//    scanf("%d%c%f",&a,&b,&c);
//    printf("%d\n%c\n%f",a,b,c);
    
    
/*    3、printf函数基本使用，分别使用后续格式控制字 %d %x %f \t \n \b
    (1)、将整形值7、100、27，以多种格式打印到屏幕 %d %x %f。
    (2)、%f练习， 打印17.2365。
    (3)、打印字符串%d、单引号、双引号。
    (4)、使用sizeof()运算符测试打印各种数据类型在计算机上所占字节长度。
 
    int d = 7;
    printf("%d\n",d);
    d = 100;
    printf("%x\n",d);
    d = 27.0;
    printf("%f\n",(float)d);
    c = 17.2365485;
    printf("%.4f",c);
    
    printf("%%d\n''\n\\\n\"\"\n");
    short e = 0;
    double f = 0;
    long l = 0;
    long double m = 0;
    long int n = 0;
    printf("%lu\n",sizeof(d));
    printf("%lu\n",sizeof(c));
    printf("%lu\n",sizeof(b));
    printf("%lu\n",sizeof(e));
    printf("%lu\n",sizeof(f));
    printf("%lu\n",sizeof(l));
    printf("%lu\n",sizeof(m));
    printf("%lu\n",sizeof(n));
*/
    /*
     
     4、计算题
     （1）、整形值使用
     计算任意自然数的平方值，并打印输出结果
     （2）、除法题
     计算25除以2的值（要求%d 和 %f 分别显示结果）
     （3）、取模运算%，请说明为什么会有这样的输出结果。
     if(15%4 == 15/4)
     printf("equal\n");
     else
     printf("not equal\n");
     （4）、使用预定义#define PI 3.1415926 使用%f打印。
     计算r = 10 的圆的周长和面积并打印显示结果。
     */
 /*   float a = 0;
    float sum;
    
    printf("请输入一个自然数：");
    scanf("%f",&a);
    sum = a * a;
    printf("%.2f的平方为： %-.2f\n",a,sum);
    
    float result = 25 / 2 ;
    int b = (int)result;
    printf("%.2f and %d\n",result,b);
    
    //计算圆
    int r = 10;
    printf("周长为：%f\n",2 * PI * r);
    printf("面积为：%f\n",PI * r * r );
  */  
    
 /*   5、字符型变量练习
    （1）、声明一个字符型变量并赋初值，显示在屏幕上。
    （2）、大写字母转小写字母，并显示在屏幕上
    （3）、int i = 49;用%c 和 %d 分别打印输出。
  */
 /*   char chr1 = 'o';
    printf("%c\n",chr1);
    chr1 = 'A';
    printf("%c\n",chr1 + 32);
    
    int i = 49;
    printf("%c %d\n",i ,i);
   */ 
    
 /*   6、编写一个自己的大写转小写的函数 char A_to_a(char a); 并在主函数里调用测试验证。
    （1）、只限于字母转换。
    （2）、如果输入的不是字母增加判断处理使程序更加健壮
   */
 /*   char chr2 = 'F';
    chr2 = A_to_a(chr2);
    printf("%c\n",chr2);
   */
    
 //   7、统计一个自然数的二进制表示形式中有多少个1。
 /*   int num1 = 9,count = 1;
    while (num1 / 2 != 0) {
        
       
        if (num1 % 2 == 1) {
            count++;
        }
         num1 = num1 / 2;
    }
    printf("%d",count);
  */
    
 //   8、找出下面程序的错误并修改，并把修改后函数的输出写出来。


    
  
    
    
    
        printf("hello world\n");
        print_segment();
            
    
 /*   9、调用函数swap能否实现a和b交换的功能，为什么？
    void swap(int i, int j)
    {
        int temp;
        temp = i;
        i = j;
        j = temp;
    }
    
    int main(void)
    {
        int a = 2, b = 3;
        swap(a, b);
        printf("a = %d, b = %d\n", a, b);
        return 0;
    }
  不可以！！int变量的值被复制进去，原来的没有变。
  */
    
//      10、编写一个函数 int is_leap_year(int year)，判断该数是不是闰年，如果year是闰年则返回1，否则返回0。如果某年份能被4整除，并且不能被100整除，那么这一年就是闰年，此外，能被400整除的年份也是闰年。
/*
    int a = is_leap_year(2008);
    printf("%s\n",a?"闰年":"平年");
    
 */   
 //   11、编写一个函数double myround(double a)，输入一个小数，将它四舍五入。例如myround(-3.51)的值是－4.0，myround(4.49)的值是4.0， 使用math.h中的库函数ceil 和 floor 实现这个函数。
/*  double b = -4.5923;
    b = myround(b);
    printf("%.1f",b);
  */
/*
    int a = 5;
    if (a) {
        printf("真\n");
    }else{
        printf("假\n");
    }
 */
    
  //  2、编写取绝对值函数int abs(int x); 并在主函数调用测试。
//    int a = 43;
//    int b = abs(a);
//    printf("%d\n",b);
    
 //   3、将1-200间不能被3整除的数输出。
  /*  for (int i = 1; i <= 200; i++) {
        if(i % 3 != 0) {
            printf("%d ",i);
        }
    }
   */ 
    
    
 //   4、数学表达式1000！结果末尾有多少个0？
 /*   int count = 0;
    
    for (int i = 5; i <= 1000; i++) {
        int k = i;
        for (int j = 1; j <= 5; j++ ) {
            
            if ( (k % 5) == 0 ) {
                k = k / 5;
                count++;
                
            }else
            {
                break;
            }
            
        }
    }
    
    printf("最后 %d\n",count);
    
  */  
    
  //  5、求表达式：sum ＝ 1 ＋ 3 ＋ 5 ＋ … ＋ 99
 /*   int sum = 0;
    for (int i = 1; i < 100; i++) {
         sum += i;
    }
    printf("sum = %d\n",sum);
  */  
    
    
  //  6、编程判断3人中谁的年龄最大，并打印最大者的年龄。
 /*   int max = 0,maxPath ;
    People pers1 = {"dadong",57,01};
    People pers2 = {"hahahs",34,02};
    People pers3 = {"fasa",24,03};
    People p[3] = {pers1,pers2,pers3};
    for (int i = 0; i < 3; i++) {
        if(p[i].age > max){
            max = p[i].age;
            maxPath = i;
        }
    }
    printf("年龄最大的是：%s\n",p[maxPath].name);
  */  
    
  //  7、有1、2、3、4个数字， 能组成多少个互不相同且无重复数字的三位数？都是多少？
 /*   int l = 0 ;
    int num[4] = {1,2,3,4};
    int num2[100] = {};
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                num2[l] = num[i] * 100 + num[j] * 10 + num[k];
                
                printf("%d ",num2[l]);
                l++;
                
            }
        }
        printf("\n");
    }
        
    printf("%d\n",l);
 */   
    /*
     8、题目：打印出如下图案
     ＊
     ＊＊＊
     ＊＊＊＊＊
     ＊＊＊＊＊＊＊
     ＊＊＊＊＊
     ＊＊＊
     ＊
 */
 /*   for (int i = 1; i <= 4; i++) {
        for (int j = 1; j <= 2 * i - 1; j++) {
            printf("*");
        }
        printf("\n");
    }
    
    for (int i = 1; i < 4; i++) {
        for (int j = 1; j <= 7 - 2 * i; j++) {
            printf("*");
        }
        printf("\n");
    }
  */
    
    
   // 9、统计一下某字符中某指定字符出现的次数。
 /*   char a[40] = "soneoifhiesnlkselfjiefsnelfesifjeifsfekl";
    char *p = a;
    char n = 'f';
    int count = 0;
    int len = (int)strlen(a);
    for (int i = 0; i < len; i++) {
        if (*(p + i) == n) {
            count++;
        }
    }
    printf("%d\n",count);
  */  
 //   10、输入3个数是否能构成三角形。
 /*   int a  = 3, b = 4 , c = 5;
    if (a + b > c && a + c > b && b + c > a && a - b < c && a - c < b && b - c < a ) {
        printf("能构成三角形！");
    }
  */  
 //   11、替换字符串中的指定字符为大写，并打印结果\
    //   例如：I like this game, 替换c字符为E。
    /*   char a[20] = "I like this game";
     char *p = a;
     char n = 'e';
     int count = 0;
     int len = (int)strlen(a);
     for (int i = 0; i < len; i++) {
     if (*(p + i) == n) {
     *(p + i) = 'E';
     }
     }
     printf("%s\n",a);
  */

 //   12、输入3个数， 判断这3个数是否能构成三角形。
  //  13、寻找一位数组中最大、小值及其坐标位置并打印输出。
 /*   int a[10] = {2,54,65,1,75,34,74,55,34,74};
    int *p = a;
    int max = 0 ,min = *a ,maxPath = 0,minPath = 0;
    for (int i = 0; i < 10; i++) {
        if (*(p + i) > max) {
            max = *(p + i);
            maxPath = i;
        }
        if (*(p + i) < min) {
            min = *(p + i);
            minPath = i;
        }
    }
    
    printf("最大值为： %d,坐标位置为：%d\n",max , maxPath);
    printf("最小值为： %d,坐标位置为：%d\n",min, minPath);
 */   
    
 // 15、实现一个函数， 它能根据参数进行加法， 减法， 乘法， 除法， 取模运算（建议采用switch语句）。
 /*   int a , b;
    char c;
    float result = 0;
    printf("请输入公式：");
    scanf("%d %c %d",&a,&c,&b);
    result = myCalculate(a , b , c );
    printf("结果为：%.2f\n",result);
  */  
/*    16、把代码段
    if(x > 0 && x < 10)
    {
        printf("x is valid\n");
    }
    else
    {
        printf("x is out of range.\n");
    }
    改写成下面这种形式：
    if(x <= 0 || x >= 10)
    {
        printf("x is out of range.\n");
    }
    else
    {
        printf("x is valid.\n");
    }
  */
    
    
    
  //  17、求1－100的素数。
  /*  int num ;
    for (int i = 1; i <= 100; i++) {
        for (int j = 2; j <= i - 1; j++) {
            if (i % j == 0) {
                break;
            }
            num = i;
        }
        printf("%d\n",num);
    }
    
  */
  /*
    for (int n = 1; n <= 100;n++){
    int a=2;
    while (a<=n)
        if (!(n%a++))
        { break;
        }
        if(a==n+1&&n!=1){
            printf("%d ",n);
        }
    }
   */
 /*
    int i,j;
    for(i=2;i<=100;i++)
    {
        for(j=2;j<=i/2;j++)
            if(i%j==0)break;
        if(j>i/2)
        {
            printf("%d ",i);
        }
    }
  */  
  //  18、自己编写程序实现void itoa(int x, char *p)(将数字x, 转换为字符串并保存到p中)
/*    int x = 9;
    char *p = "";
//        char a = 0 + 48;
//        printf("%c \n",a);
    itoa(x, p);
    printf("%c",*(p + 1));
    
   
    int x = 987;
    char *p ="";
    int n = 0;
    itoa1(x, p);
    
    printf("%s",p);
 */
    
    int x = 10 ,y = 10 ,i;
    for (i = 0; x > 8 ; y = ++i) {
        printf("%d %d \n",x--,y);
    }
    
    int a = 16 ,k = 2, m = 1;
    a /= SQR(k + m) / SQR(k + m);
    printf("%d\n",a);

    return 0;
}

