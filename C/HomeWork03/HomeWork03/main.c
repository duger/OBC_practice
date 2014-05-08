//
//  main.c
//  HomeWork03
//
//  Created by Duger on 13-8-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");

 /* //    1、打印1 - 100中不能被7整除又不包含7的数。
    //方法一
    int i = 0;
    
    for (i = 1; i <= 100; i++) {
        if ((i%10 != 7) && (i%7 != 0) && (i / 10 != 7) ) {
            printf("%d\n",i);
        }
    }
    //方法二
    int i = 0;
  
    for ( i = 1 ; i <= 100 ; i++)
    {
        if ((i%10 == 7) || (i%7 == 0) || (i / 10 != 7) ) {
            break;
            printf("%d\n",i);
        }
  
    }
  
    

   //    2、输入两个数，求最小公倍数和最大公约数。
  //方法一  
  int a = 0,b = 0,temp = 1,temp2 = 0;
    
    printf("请输入两个数：");
    scanf("%d%d",&a,&b);
    temp2 = a * b;              //最小公倍数 * 最大公约数
//    printf("%d\n",a%b);
    
    do {
        
        temp = a%b;             //碾转反除法
        a = b;
        b = temp;               //交换值
    } while (temp != 0);
    
    printf("最大公约数为：%d\n",a);
    printf("最小公倍数是：%d\n",temp2 / a);
  */
 /*  //方法二
  int a = 0;
  int b = 0;
  int max = 0;
  int min = 0;
  
  printf("输入两个数:");
  scanf("%d %d",&a,&b);
  
  if (a < b) {
  max = b;
  min = a;
  }else
  {
  max = a;
  min = b;
  }
  
  for (; 1; ) {
  if ((a % min == 0) && (b % min == 0)) {
  printf("两数最大公约数为:%d\n",min);
  break;
  }
  min--;
  }
 
  for (;1 ; ) {
  if (((max % a) == 0) && ((max % b) == 0)) {
  printf("两数的的最小公倍数为:%d\n",max);
  break;
  }
  max++;
  }

    */
    
//    3、随机产生20个[10 , 100]的正整数，输出这些数以及他们中的最大数
    
  /*  int num1 = 0,num2 = 0;
   
    srand( (unsigned)time( NULL ) );  //产生随机数的种子，由时间产生，更科学，更随机 （有点儿密码学里的密钥的意思）
    for (int i = 1; i <= 20; i++) {
        num1 = rand()%100;             //产生随机数
        printf("第%d个数为：%d\n",i,num1);
        if (num1 > num2) {
            num2 = num1;
        }
        
    }
    printf("最大值为：%d",num2);
    
//    4、编程将所有“水仙花数”打印出来，并打印其总个数。 “水仙花数”是一个 各个位立方之和等于该整数的三位数。
    int num3 = 100,a = 0,b = 0,c =0,d = 0,count = 0;
    printf("水仙花数为：");
    for (num3 = 100; num3 <= 999; num3++) {
        a = num3 % 10;
        b = (num3 % 100 - a) / 10;
        c = (num3 - num3%100) / 100;
        d = a*a*a + b*b*b + c*c*c;
        if (num3 == d) {
            count = count + 1;
            printf("%d  \n",num3);
        }
        
    }
    printf("水仙花数共：%d\n",count);
    
    
    
 /*   5、使用循环打印三角形
      *
     ***
    *****
  */
 /*   for (int i = 1; i <= 3; i++) {
        for (int j = 1; j <= 3-i; j++) {
            printf(" ");
        }
        for (int k = 1; k <= 2*i -1; k++) {
            if (k == 1 | k == 2*i - 1) {
                printf("*");
            }else
                {
                printf(" ");
                }
            
        }
        printf("\n");
        
    }
    for (int i = 1; i <= 2; i++) {
        for (int j = 1; j <= i; j++) {
            printf(" ");
        }
        for (int k = 1; k <= 5 - 2*i; k++) {
            if (k ==1 | k == 5 - 2 * i) {
                printf("*");
            }else
            {
                printf(" ");
            }
            
        
            
        }
        printf("\n");
    }
  */
//    char c;
//    int char1 = 0, num1 = 0, press = 0 , other = 0;
//    while ((c = getchar())!='\n') {
//        
//        printf("c = %c\n", c);
//        
//        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
//            char1 += 1;
//            
//        }else if(c >= '0' && c <= '9')
//        {
//            num1 += 1;
//            
//        }else if (c == ' ')
//        {
//            press += 1;
//        }else
//        {
//            other += 1;
//        }
//    }
//    
//    printf("char: %d \nnum1: %d\npress: %d\nother: %d",char1,num1,press,other);


    
//    7、求S(n) = a+aa+aaa+aaaa+...+aa..a之值，其中a是一个数字，n表示a的位数例如：2+22+222+2222+22222(此时n=5)，n和a都从键盘输入。
    unsigned long a1 = 0, n = 0,m = 0,num4 = 0, num5 = 1, sn = 0;
    printf("请输入a和n:");
    scanf("%ld%ld",&a1,&n);
    num4 = a1;
    for (int l = 1; l <= n ; l++) {
        
            
            for (m = 1; m <= l ; m++) {
                
                num5 = num5  * 10;
               
            }
            num4 = num5*a1 + num4;
            num5 = 1;
            printf("%ld\n",num4);
            sn = sn + num4;
        
    }
    printf("S = %ld\n",sn);
  
    
//    8、求1!+2!+3!+4!+..+20!
//    long int a = 0 ,b = 0 ,c = 1,sum = 0;
//    for (a = 1; a <= 20; a++) {      //20个数的循环
//        for (b = 1; b <= a; b++) {   //每个数的相乘循环 1*2*3*4
//            c = c * b;
//            
//        }
//        sum = sum + c;               //数相加
//        c = 1;                       //重置没个数相乘的初始数为1
//        printf("sum: %ld\n",sum);
//    }
//    printf("结果：%ld\n",sum);
  
  
//    9、一个球从100m高度自由落下，每次落地后反跳回原来高度的一半，再落下，再反弹。求它在第 10次落地时，共经过多少米？第10次反弹多高？  
 /*   float s = 0,h = 0 , a = 1;;
    int t = 0;
    printf("输入次数t：");
    scanf("%d",&t);
    s = 100;
    for (int i = 1; i <= t; i++) {
        a = 2 * a;
        s = s + 2*h;
        h = 100 / a;
       
        
    }
    printf("h = %f\n",h);
    printf("s = %f\n",s);
   //方法二
    float s = 0,h = 100 , a = 1;;
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
  */
    
//    10、猴子吃桃问题。猴子第一天摘下若干个桃子，当即吃了一半，还不过瘾，又多吃了一个。第二天早上又将剩下的桃子吃掉一半，又多吃一个。以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，就只剩一个桃子了。求第一天共摘多少个桃子。
 /*
    int a = 1, day = 9;
    for (int i = 1; i <= 9 ; i++) {
        a = (a + 1) * 2;
    }
    printf("桃子总共：%d",a);
 */
    return 0;
}


