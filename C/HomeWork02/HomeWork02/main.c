//
//  main.c
//  HomeWork02
//
//  Created by Duger on 13-8-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    //3. 嵌入式系统中经常要用到无限循环，你怎么样用C编写死循环呢？   for(;;);不需要判断，直接执行循环体（空语句）        先判断。        第一；无i初始化执行语句，第二 ；表示 无条件执行，第三 ；无i增量 操作。   while(1);先判断，再执行循环体（空语句） do{;}while(1);先执行循环体（空语句），再判断
    for (; ; ) {
        printf("a");
        break;
    }
    while (1) {
        printf("w");
        break;
    }
    do {
        printf("b\n");break;
    } while (1);
    
    //11. 嵌入式系统总是要用户对变量或寄存器进行位操作。给定一个整型变量a，写两段代码，第一个设置a的bit3，第二个清除a 的bit 3。在以上两个操作中，要保持其它位不变。
    //设置用 0100 或| 一下。
    //清除用 1011 并& 一下。
  /*  char a = 'a';   //0b01100001
    char b = a | 0b00000100;
    printf("%c",a);
    char c = a & 0b10111111;
    printf(" "); */
    
    /*13. 下面的代码输出是什么，为什么？
    void foo(void)
    {
        unsigned int a = 6;
        int b = -20;
        (a+b > 6)？puts("> 6") : puts("<= 6");
    } */
    
    
    
    /*18. C语言同意一些令人震惊的结构,下面的结构是合法的吗，如果是它做些什么？
    
     int a = 5, b = 7, c;
    c = a+++b;
    printf("%d %d",c,a);
    //结果为 12  6 
    */
    
    
    //23. 分别给出bool，int，float，指针变量 与“零值”比较的 if 语句（假设变量名为var）.
        
//    28. 请写一个c函数，若处理器是big_endian的，则返回0；若是little_endian的，则返回1。
    
   /* 31. 下面是C 语言中两种if 语句判断方式。请问哪种写法更好？为什么？
        int n;
    if (n = 10) // 第一种判断方式
        if (10 == n) // 第二种判断方式   */

            
            
    /*33．用C写个程序，如何判断一个操作系统是16 位还是32 位的？不能用sizeof()函数。
            
            2的16次方为65536
            unsigned int a = ~0;
    if(65535 == a)
    {
        printf("16bit");
    }else printf("32bit");
    */
    
    
    
/*  35. 在不用第三方参数的情况下，交换两个参数的值.
    方法1：i=i+j,j=i-j,i=i-j
    方法2：异或法 （找不同）i ^= j;  j ^= i ;i ^=j;
    方法3：加减法  a= a + b -(b = a)
 */
    
 /*   39. 下面的函数实现在一个固定的数上加上一个数，有什么错误，改正
    int add_n(int n)
    {
        static int i=100;
        i+=n;
        return i;
    }
  */
    
/*   41. i 最后等于多少?
    int i = 1;
    int j = i++;//i = 2, j = 1
    if((i>j++) && (i++ == j)) //i = 3, j =2
        i+=j;
 */
    int i = 1;
    int j = i++;//i = 2, j = 1
    if((i>j++) && (i++ == j)) //i = 3, j =2
        i+=j;
    printf("%d\n",i);
    
//  63. 不能做switch()的参数类型是：
    
    
//  67. 语句for( ；1 ；)有什么问题？它是什么意思？
//    for( ;1;)
//    {
//        printf("dd");
//    }
    
//  68. do……while和while……do有什么区别？
    
//   112. -1,2,7,28,,126 请问28 和126 中间那个数是什么？为什么？ 63?
    
/*         120. 请问下面程序有什么错误?
        int a[60][250][1000],i,j,k;
    for(k=0;k <=1000;k++)
        for(j=0;j <250;j++)
            for(i=0;i <60;i++)
                a[i][j][k]=0;
 */
//    134. 设有int a=3;则执行语句a+=a*=a+a;后变量a的值是?  36
    
    int a = 3;
    a+=a*=a+a;
    printf("%d",a);
    
    
    return 0;
}

