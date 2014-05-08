//
//  main.c
//  ClasDemo03
//
//  Created by Duger on 13-8-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    
//    int i= 1,sum = 0;     
//    
//    while (i <= 100) {
//        sum += i;
//        i++;
//    }
//    
//    printf("sum: %d\n",sum);

//    int i = 1, sum = 0;
//    
//    while (i <= 100) {
//        if ((i%13) == 0) {
//            printf("%d\n",i);
//            sum += i;
//        }
//        i++;
//    }
//    printf("sum: %d\n",sum);
    
//    unsigned i = 1, sum = 1,num1 = 0,n = 0;
//    
//    printf("请输入基数：");
//    scanf("%d",&num1);
//    printf("请输入幂数：");
//    scanf("%d",&n );
//    
//    while (i <= n ) {
//        sum *= num1;
//        i++;
//    }
//    
//    printf("sum: %d\n",sum);
//    
//    int i = 1;
//    
//    while (i <= 100) {
//        if (i%2 == 1) {
//            printf("%d\n",i );
//        }
//        i++;
//    }
    
    
//    unsigned num =1;
//    printf("请输入整数：");
//    scanf("%d",&num);
//    
//    int i = 0;
//    do {
//        num = num / 10;
//        if (num  == 0) {
//            printf("整数为： %d",i );
//        }
//        i++;
//    } while (num  > 0);
    
//    while (num > 0) {
//        num /= 10;
//        if (num == 0) {
//            printf("整数为： %d",i );
//        }
//        i++;
//    }
    
//    do {
//        num /= 10;
//        i++;
//        
//    } while (num != 0);
//    printf("整数为： %d",i );
    
//    int i = 0,sum = 0;
//    
//    for (i = 100; i >= 1; i--) {
//        sum += i;
//    }
//    printf("sum = %d\n",sum);
    
    
//    int a =0, b = 0,num1 = 1;
//    for (a = 1; a <= 9; a++) {
//        for (b = 1; b <= a; b++) {
//            num1 = a * b;
//            printf("%d * %d = %d ",a,b,num1);
//            
//        }
//        printf("\n");
//    }
    
//    long  count = 0,num1 = 0,num2 = 1,sum = 0;
//    for (count = 1; count <= 20; count++) {             //定义20个数
//        for (num1 = 1; num1 <= count; num1++) {
//            num2 *= num1;
//            printf("%ld ",num2);
//        }
//        
//        sum += num2;
//        num2 = 1;           //重置数字的和 num2的值
//        printf("= %ld\n",sum);
//    }
//    printf("sum = %ld",sum);
    
    //跳出死循环
//    int i = 1;
//    while (1) {
//        if (i == 20) {
//            
//            break;
//        }
//        i++;
//    }
    
    //goto语句
done:
    for (int i = 1; i <= 100; i++) {
        printf("%d\n",i);
    }
    goto done;
    
    
    return 0;
}



