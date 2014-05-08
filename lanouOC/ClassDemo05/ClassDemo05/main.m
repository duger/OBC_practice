//
//  main.m
//  ClassDemo05
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
 /*
        NSString *str = [[NSString alloc]initWithString:@"张三"];
        NSLog(@"%@,%p",str,str);
        NSLog(@"string%lu",[str retainCount]);
        [str release];
        
        NSString *str1 = [[NSString alloc]initWithFormat:@"%@",@"hah"];
        NSLog(@"%@,%p",str1,str1);
        NSLog(@"format%lu",str1.retainCount);
        NSLog(@"%p",str1);
        
        NSString *strR = [str1 stringByAppendingString:@"hey"];
        
        NSString *str2 = [[NSString alloc]initWithString:str1];
        NSLog(@"%@",str2);
        NSLog(@"%lu",str2.retainCount);
        [str1 release];
        [str2 release];
  
        const char *str = "王甫";
        NSString *str1 = [NSString stringWithCString:str encoding:NSUTF8StringEncoding];   //utf-8  编码是4
        NSLog(@"str1 = %@",str1);
        NSLog(@"str1 len: %lu",str1.length);
        
        NSLog(@"%d",[str1 characterAtIndex:1]);
   */
  /*
        NSString *str = @"zhangsan";
        [str substringFromIndex:3];
        NSRange range = NSMakeRange(2, 5);
        
        NSString *str2 = [str substringWithRange:range];
        NSLog(@"%@",str2);
        
        NSLog(@"%ld",[str2 compare:str]);
        NSRange range2 = [str rangeOfString:@"an"];
        NSLog(@"起始位置%ld 长度%ld",(unsigned long)range2.location,(unsigned long)range2.length);
        
        NSString *str3 = @"文艺青年很文艺";
        NSLog(@"%@",[str3 stringByReplacingOccurrencesOfString:@"文艺" withString:@"2B"]);
        NSLog(@"%@",[str3 stringByReplacingOccurrencesOfString:@"2B" withString:@"文艺" options:0 range:NSMakeRange(0, 2)]);
        NSString *str4 = [str3 stringByReplacingCharactersInRange:NSMakeRange(0, 2) withString:@"213"];
        NSLog(@"%@",str4);
     */   
  /*
        NSString *str = @"3453.3443";
        CGFloat b = [str floatValue];
        NSLog(@"%f",b);
        
        NSString *str1 = @"am a LuKy boY!";
        NSLog(@"%@",[str1 capitalizedString]);
        NSLog(@"%@",[str1 capitalizedStringWithLocale:[NSLocale ]]);
        NSLog(@"%@",[str1 lowercaseString]);
        NSLog(@"%@",[str1 uppercaseString]);
   */
  /*      NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:0];
        [mutableString setString:@"hahah"];
        NSLog(@"%@",mutableString);
        NSMutableString *mutableString2 = [NSMutableString stringWithCapacity:0];
        [mutableString2 setString:@"fe"];
        [mutableString2 insertString:@"aaaa" atIndex:2];
        [mutableString2 replaceCharactersInRange:NSMakeRange(0, 2) withString:@"bbb"];
        
        NSMutableString *mutableString3 = (NSMutableString *)[mutableString2 uppercaseString];
        [mutableString3 insertString:@"ss" atIndex:2];
        
        NSLog(@"%@",mutableString3);
    */
      NSArray *array = [[NSArray alloc]initWithObjects:@"zhangsan",@"lisi",@"wangfu", nil];
        NSLog(@"%@",array[1]);
        NSLog(@"%@",[array objectAtIndex:1]);
        for (NSString *str in array) {
            NSLog(@"%@",str);
        }
        
        NSArray * arr = [array arrayByAddingObject:@"haha"];
        NSLog(@"%@",arr);
        
        NSArray *arr1 = [arr arrayByAddingObjectsFromArray:@[@"adf",@"ddd"]];
        NSLog(@"arr1:%@",arr1);
        
        NSLog(@"索引：%ld",[arr1 indexOfObject:@"adf"]);
        
        NSLog(@"%ld",(unsigned long)[arr isEqualToArray:arr1]);
        
        NSLog(@"%d",[arr containsObject:@"zhangsan"]);
        
        NSLog(@"%@",[arr description]);
        
        NSArray *arr2 = nil ;
        NSArray *arr3 = [[NSArray alloc]initWithObjects:@"", nil];
        [arr getObjects:&arr3 range:NSMakeRange(1, 2)];
        NSLog(@"%@",arr3);
    
        NSMutableArray *arr4 = [[NSMutableArray alloc]initWithObjects:@"sara",@"haha",@"haha",@"sara",@"haha",@"sara",@"sara",@"sara", nil];
        [arr removeObject:@"haha"];
        NSLog(@"%@",arr4);
    }
    
    return 0;
}

