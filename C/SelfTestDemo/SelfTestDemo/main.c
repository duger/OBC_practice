//
//  main.c
//  SelfTestDemo
//
//  Created by Duger on 13-8-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

#define FREEZING_PT 32.0f           //华氏度转摄氏度定义的值
#define SCALE_FACTOR ( 5.0f / 9.0f)  // 注意要加括号！和数字后面加f 否则会被向下取整

#define RACE_PI ((4.0f / 3.0f ) * 3.1415926)  //计算球体

#define RANGE_DOLLER (1.0 + 0.05f)          //美元税率

#define DOLLAR_20 20                        // 美元面值
#define DOLLAR_10 10
#define DOLLAR_5 5

//void quicksort(int a[], int low , int high);
//int split(int a[],int low ,int high);

/**************************  判定素数   ***************************/
bool isPrime(int n)
{
    if (n <= 1) {
        return false;
    }
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return false;
        }
        return true;
    }
}

int split(int a[] ,int low ,int high)
{
    int part_element = a[low];
    
    for (; ; ) {
        while (low < high && part_element <= a[high]){
            high--;}
        if (low >= high)
            break;
        
        a[low++] = a[high];
        
        
        
        while (low < high && a[low] <= part_element){
            low++;}
        if (low >= high)
            break;
        
        a[high--] = a[low];
        
        
        
    }
    a[high] = part_element;
    return high;

    
}



void quicksort(int a[],int low,int high)
{
    int middle;
    
    if (low >= high) {
        return;
    }
    middle = split( a, low ,high);
    quicksort(a, low, middle - 1);
    quicksort(a , middle + 1, high);
}


int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
/*    //产生随机数
    srand((unsigned)time(NULL));
    int  num1 = rand()%10+20;
    printf("%d\n",num1);
    
    //美国物流行业计算空间体积计费方式 （原体积加165后 除166）国内194  国内166
    int length, heigh, width, volume ,weigth;
    
    printf("Enter heigh of the box:");
    scanf("%d",&heigh);
    printf("Enter length of the box:");
    scanf("%d",&length);
    printf("Enter width of the box");
    scanf("%d",&width);
    
    volume = heigh * length * width;
    weigth = (volume + 165) / 166;
    
    printf("Dimensions: %dx%dx%d\n",heigh,length,width);
    printf("Volume (conic inches): %d\n",volume);
    printf("Dimensional weigth(pounds): %d\n",weigth);
  
    
    //华氏度转摄氏度 Farenheit temperature to celsius
    float farenheit , celsius;
    
    printf("Enter the farenheit temperature :");
    scanf("%f",&farenheit);
    
    celsius = (farenheit - FREEZING_PT) * SCALE_FACTOR;
    
    printf("Celsius equivalent : %.2f\n",celsius);
    
    
    //prectice2.0
    int a , b ,c ;
    float i , j , k;
    printf("The value a = %d\n",a);
    printf("The value b = %d\n",b);
    printf("The value c = %d\n",c);
    
    printf("The value i = %f\n",i);
    printf("The value j = %f\n",j);
    printf("The value k = %f\n",k);
  
    //输出勾号
    for (int i = 1; i <= 6; i++) {
        if (i <= 3) {                                           //上三行
            for (int k = (6 - i); k <= i - 1; k++) {            //上部分空格“ ”
                printf(" ");
            }
            
            for (int j = (5 - i); j <= 13 - 2 * i; j++) {       //上部分星号 *
                if (j == 1 || j == 13 - 2 * i) {
                    printf("*");
                }else
                    printf(" ");
            }
            printf("\n");
        }else
        {
            
        
            for (int k = 1; k <= i - 4; k++) {
                printf(" ");
            }
            
            for (int j = 1; j <= 13 - 2 * i; j++) {
                if (j == 1 || j == 13 - 2 * i) {
                    printf("*");
                }else
                    printf(" ");
            }
            printf("\n");
        }
    }
  
     //计算球体体积
    float r = 0,v = 0;
    
    printf("Enter the radius：");
    scanf("%f",&r);
    
    v = r * r * r *RACE_PI;
    
    printf("此球的体积为：%.2f",v);
    
   
    //一个长公式 可以在记号之间分开分行写，看起来更整齐
    //第一种
    int num1 = 3 , num2 = 0 ;
    num2 = 3 * num1 * num1 * num1 * num1 * num1 +
           2 * num1 * num1 * num1 * num1-
           5 * num1 * num1 * num1 -
           1 * num1 * num1 +
           7 * num1 -
           6;
           
    printf("%d\n",num2);
    
    //第二种
    int num3 = 3 , num4 = 0 ;
    num4 = 3 * num3 + 2 ;
    num4 = num4 * num3 - 5;
    num4 = num4 * num3 - 1;
    num4 = num4 * num3 + 7;
    num4 = num4 * num3 - 6;
    
    printf("%d\n",num4);
    
    //第三种
    num3 = 3;
    num4 = 0;
    
    num4 = ((((3 * num3 + 2)
            * num3 - 5)
            * num3 - 1)
            * num3 + 7)
            * num3 - 6;
    
    printf("%d\n",num4);
  
    
    //计算加上汇率后的金额
    float money = 0 , total = 0;
    
    printf("Enter how much money:");
    scanf("%f",&money);
    
    total = money * RANGE_DOLLER;
    
    printf("Grand total: %.2f",total);
  
    int money = 0, dolr20 = 0, dolr10 = 0, dolr5 = 0, dolr1 = 0 ;
    
    printf("Enter your money:");
    scanf("%d",&money);
    
    dolr20 = money / DOLLAR_20;
    money = money % DOLLAR_20;
    
    dolr10 = money / DOLLAR_10;
    money = money % DOLLAR_10;
    
    dolr5 = money / DOLLAR_5;
    money = money % DOLLAR_5;
    
    dolr1 = money ;
    
    printf("$20 bills: %d\n",dolr20);
    printf("$10 bills: %d\n",dolr10);
    printf("$5 bills: %d\n",dolr5);
    printf("$1 bills: %d\n",dolr1);
  
    float loan = 0.0, rate = 0.0 , monthPay = 0.0 , payment = 0.0;
    printf("请输入贷款金额： 年利率： 每月支付金额：");
    scanf("%f%f%f",&loan,&rate,&monthPay);
    
    for (int i = 1; i <= 12; i++) {
        loan = (loan - monthPay) + loan * ((0.01 * rate) / 12);
        
        printf("第%d个月还款后贷款金额为：%.2f\n",i,loan);
        
    }
    //日期的转换
    int month , day , year ;
    printf("Enter a date (mm/dd/yyyy):");
    scanf("%d /%d /%d",&month,&day,&year);
    printf("You entered the date: %4d%02d%02d\n",year,month,day);
    
    float m =1123099.993;
    printf("$%7.2f",m);
 
    int prefix , identi , pubCode , itemNum ,checkDigit ;
    printf("Enter ISBN : ");
    scanf("%d -%d -%d -%d -%d",&prefix,&identi,&pubCode,&itemNum,&checkDigit);
    
    printf("GS1 prefix: %d\n",prefix);
    printf("Group identifier: %d\n",identi);
    printf("Publisher code: %d\n",pubCode);
    printf("Item number: %d\n",itemNum);
    printf("check digit: %d\n",checkDigit);
 
    int a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8 ,
        a9 , a10 , a11 , a12, a13 , a14 , a15 , a16 ;
    
    srand((unsigned)time(NULL));
    
    a1 = rand()%15 + 1;

    // (- i) / j 和 - （i / j) 的区别
    int i = 8 , j = 5;
    printf("Enter i and j:\n");
//    scanf("%d%d",&i,&j);
    printf("(-i) / j = %d\n-(i / j) = %d\n",( -i ) / j ,- (i / j));
 
    int i = 10 , j = 5 ;
    printf("%d ", i++ - ++j);
    printf("%d %d",i , j);
  
    
    //求最大值
    int a = 5 , b = 20 , max ;
    max = a > b ? a : b ;
    printf("%d\n",max);
    
    printf("%d\n", a > b ? a : b);
    
    bool flag;
    flag = true;
    printf("%d",flag);
   
    int i = 2 , j = 0;
    switch (i) {
        case 1:
            printf(" :");
            break;
            
            }
    j = getchar();
    printf("j = %c\n",j);
*/
    int i = 5 , j = 0, k = -5 ;
    printf("%d\n", (!i && j) || k);
    
    /**************************     函数    ***************************/
    
    /**************************  判定素数   ***************************/
 /*   int n;
    printf("Enter a number:");
    scanf("%d",&n);
    if (isPrime(n)) {
        printf("Prime\n");
    }
    else
        printf("Not Prime\n");
  */
    /**************************  快速排序算法   ***************************/
    int a[10] = {9,15,47,82,2,55,13,3,25,51};
    
    quicksort(a, 0, 9);
    
    printf("In sorted order: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ",a[i]);
    
    }
        printf("\n");
    
    
    
    
    
    
    return 0;
}



