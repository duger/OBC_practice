//
//  main.m
//  FoundationDemo1
//
//  Created by Duger on 13-8-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        /*------------------------NSNumber-------------------*/
        //创建一个（数字对象）NSNumber对象
        /*
        NSNumber *monthNumber = [NSNumber numberWithInt:10];
        NSNumber *lengthNumber = [[NSNumber alloc] initWithFloat:10.8];
        NSLog(@"monthNumber : %@",monthNumber);
        NSLog(@"lengthNumber : %@",lengthNumber);
        
        //数字对象 还原成基本数据类型
        int month = [monthNumber intValue];
        float length = [lengthNumber floatValue];
        NSLog(@"month : %d",month);
        NSLog(@"length : %.2f",length);
         */
        /*------------------------NSString-------------------*/
        //创建一个字符串常量
        /*
        NSString *string1 = @"这是一个字符串常量";
        NSLog(@"string1 : %@",string1);
        //创建一个空的字符串
        NSString *string2 = [[NSString alloc] init];
        NSString *string3 = [NSString string];
        NSLog(@"string2 : %@",string2);
        NSLog(@"string3 : %@",string3);
        //快速创建一个字符串  常量区
        NSString *string4 = [[NSString alloc] initWithString:@"abc"];
        NSString *string5 = [NSString stringWithString:@"abc"];
        NSLog(@"string4 : %@",string4);
        NSLog(@"string5 : %@",string5);
        //创建一个格式化的字符串  堆区
        NSString *string6 = [[NSString alloc] initWithFormat:@"整数：%d",10];
        NSString *string7 = [NSString stringWithFormat:@"浮点数：%f",10.8];
        NSLog(@"string6 : %@",string6);
        NSLog(@"string7 : %@",string7);
        
        //字符串的比较
        //比较字符串内容是否相同
        if ([string4 isEqualToString:string5]) {
            NSLog(@"same content");
        }else{
            NSLog(@"different content");
        }
        
        NSString *string8 = [NSString stringWithString:@"abc"];
        NSString *string9 = @"abc";
        //比较字符串的内容
        if ([string8 isEqualToString:string9]) {
            NSLog(@"same content");
        }else{
            NSLog(@"different content");
        }
        //比较是否是同一个对象
        if (string8 == string9) {
            NSLog(@"same pointer");
        }else{
            NSLog(@"different pointer");
        }
        
        //比较字符串的大小
        NSString *string10 = [[NSString alloc] initWithFormat:@"a"];
        NSString *string11 = [[NSString alloc] initWithFormat:@"b34 "];
        NSComparisonResult result  =[string10 caseInsensitiveCompare:string11];
        NSLog(@"result : %d",result);
        
        //求字符串的长度
        NSLog(@"Longth: %d",[string11 length]);
        
        
        //字符串的转换
        NSString *string12 = @"hello WOrLd";
        NSLog(@"upper :%@",[string12 uppercaseString]);
        NSLog(@"lower :%@",[string12 lowercaseString]);
        NSLog(@"capital :%@",[string12 capitalizedString]);
        
        //字符串转换成基本数据类型
        NSString *string13 = @"3.14";
        float pi = [string13 floatValue];
        NSLog(@"Pi : %.2f",pi);
        
        //基本数据类型转换成字符串
        float b = 4.23;
        NSString *string14 = [[NSString alloc] initWithFormat:@"%f",b];
        NSLog(@"sting14: %@",string14);
        
        //字符串转化成数组
        NSString *string15 = @"abc xyz des";
        NSArray *array1 = [string15 componentsSeparatedByString:@" "];
        NSLog(@"array1 : %@",array1);
        
        //截取字符串
        NSString *string16 = @"abcdef";
        NSString *substring1 = [string16 substringToIndex:2];
        NSString *substring2 = [string16 substringFromIndex:2];
        NSString *substring3 = [string16 substringWithRange:NSMakeRange(2, 1)];
        NSLog(@"substring1 : %@",substring1);
        NSLog(@"substring2 : %@",substring2);
        NSLog(@"substring3 : %@",substring3);
    
        NSRange range1 = {4, 2} ;
        NSString *substring4 = [string16 substringWithRange:range1];
        NSLog(@"substring4 : %@",substring4);
         
        //字符串的拼接
        NSString *string17 = @"adb";
        NSString *string18 = @"23";
        NSString *appstring1 = [[NSString alloc] initWithFormat:@"%@ and %@",string17,string18];
        NSString *appstring2 = [string17 stringByAppendingFormat:@"%@",string18];
        NSString *appstring3 = [string17 stringByAppendingString:string18];
        NSLog(@"appstring1 : %@",appstring1);
        NSLog(@"appstring2 : %@",appstring2);
        NSLog(@"appstring3 : %@",appstring3);
        
        //查找字符串
        NSString *link = @"daknk;l_darkgee!";
        NSRange range2 = [link rangeOfString:@"_dark"];
        NSLog(@"%@",NSStringFromRange(range2));
        if (range2.location != NSNotFound) {
            NSLog(@"founded!"); 
        }
        /////////////////////////////////////////////////////
        //可变字符串
        NSMutableString *mutableString1 = [[NSMutableString alloc] initWithFormat:@"abc"];
        //插入字符串
        [mutableString1 insertString:@"...fjg" atIndex:3];
        NSLog(@"%@",mutableString1);
        //替换字符串
        [mutableString1 replaceCharactersInRange:NSMakeRange(0, 3) withString:@"def"];
        NSLog(@"%@",mutableString1);
        //删除字符串
        [mutableString1 deleteCharactersInRange:NSMakeRange(0, 3)];
        NSLog(@"%@",mutableString1);
        */
        
        /*------------------------NSArray -------------------*/
        //创建一个数组
        NSArray *array1 = [NSArray arrayWithObject:@"one"];
        NSArray *array2 = [NSArray arrayWithObjects:@"one",@"two",nil];
        NSArray *array3 = [NSArray arrayWithArray:array2];
        NSLog(@"array1 : %@",array1);
        NSLog(@"array2 : %@",array2);
        NSLog(@"array3 : %@",array3);
        NSArray *array4 = [[NSArray alloc] initWithArray:array3];
        NSLog(@"array4 : %@",array4);
        
        //获取数组中的元素个数和访问
        int count = [array2 count];
        NSLog(@"the count of element in array2 : %d",count);
        NSString *string1 = [array2 objectAtIndex:0];
        NSLog(@"the element in array2 : %@",string1);
        
        //追加数组
        NSArray *array5 = [array2 arrayByAddingObject:@"end"];
        NSLog(@"new array5: %@",array5);
        
        //数组 -> 字符串
        NSString *string2 = [array2 componentsJoinedByString:@","];
        NSLog(@"string2 : %@",string2);
        
        //判断是否存在一个指定的对象
        BOOL isContain = [array5 containsObject:@"end"];
        NSLog(@"isContain : %d",isContain);
        
        //根据指定对象返回索引下标、返回数组中最后一个元素
        NSInteger index = [array5 indexOfObject:@"end"];
        NSLog(@"index: %d",index);
        NSString *last = [array5 lastObject];
        NSLog(@"lastObject : %@",last);
        
        
        /*---------------------NSDictionary------------------*/
        
        
        /*-------------------------NSSet---------------------*/
        
        
    }
    return 0;
}

