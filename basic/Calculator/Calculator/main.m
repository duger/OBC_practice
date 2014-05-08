//
//  main.m
//  Calculator
//
//  Created by Duger on 13-7-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //计算器 实现
        Boolean flag = true;
        while (flag) {
            char a;
            float number1,number2 = 0;
            printf("a表示加分\n");
            printf("b表示减分\n");
            printf("c表示乘分\n");
            printf("d表示除分\n");
            printf("q表示退出\n");
            printf("请输入你的选择:");
            scanf("%c",&a);
            
            
            switch (a) {
                case 'a':
                    scanf("%f",&number1);
                    printf("请输入第二个数字：");
                    scanf("%f",&number2);
                    printf("%.1f + %.1f = %.1f\n",number1,number2,number1 + number2);
                    break;
                case 'b':
                    printf("请输入第一个数字：");
                    scanf("%f",&number1);
                    printf("请输入第二个数字：");
                    scanf("%f",&number2);
                    printf("%.1f - %.1f = %.1f\n",number1,number2,number1 - number2);
                    break;
                case 'c':
                    printf("请输入第一个数字：");
                    scanf("%f",&number1);
                    printf("请输入第二个数字：");
                    scanf("%f",&number2);
                    printf("%.1f * %.1f = %.1f\n",number1,number2,number1 * number2);
                    break;
                case 'd':
                    printf("请输入第一个数字：");
                    scanf("%f",&number1);
                    printf("请输入第二个数字：");
                    scanf("%f",&number2);
                    printf("%.1f / %.1f = %.1f\n",number1,number2,number1 / number2);
                    break;
                case 'q':
                    flag = false;
                    printf("已经退出！");
                    break;
                default:
                    break;
            }
        }
    }
    return 0;
}

