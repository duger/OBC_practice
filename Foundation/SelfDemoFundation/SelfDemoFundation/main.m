//
//  main.m
//  SelfDemoFundation
//
//  Created by Duger on 13-9-7.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
    /******************************    NSNumber  *******************************************************/
        
     
     
      /******************************    NSNumber  *******************************************************/
     
     
     
      /******************************    NSNumber  *******************************************************/
     
     
     
      /******************************   NSDictionery  *******************************************************/
        NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"velure" forKey:@"key"];
        NSEnumerator *enumerator = [dic1 keyEnumerator];
        id key;
        while ( key = [enumerator nextObject]) {
            
            NSLog(@"%@",[dic1 objectForKey:key]);
           
        }
        
    /******************************   NSDictionery  *******************************************************/
        NSMutableSet *set1 = [NSMutableSet setWithObjects:@"2",@"a",@"b", nil];
        NSMutableSet *set2 = [NSMutableSet setWithObjects:@"a",@"1",@"c", nil];
        //相减
        [set1 minusSet:set2];
        NSLog(@"%@",set1);
        NSArray *arr = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
        NSSet *set3 = [NSSet setWithArray:arr];
        NSLog(@"%@",set3);
        NSLog(@"%ld",set3.count);
        //取出字典的值为一数组
        NSArray *arr2 = [set3 allObjects];
        NSLog(@"%@",[arr2 description]);
        //返回任意对象
        id object = [set3 anyObject];
        NSLog(@"%@",object);
        //是否包含某一元素
        BOOL iscontent = [set3 containsObject:@"d"];
        NSLog(@"%d",iscontent);
        //是否有交集
        BOOL isjiaoji = [set3 intersectsSet:set1];
        NSLog(@"%d",isjiaoji);
        //是否相匹配
        BOOL isquire = [set3 isEqualToSet:set2];
        NSLog(@"%d",isquire);
        //是否是另个集合的子集
        bool issub = [set3 isSubsetOfSet:set2];
        NSLog(@"%d",issub);
        
        //nsset 添加元素
        NSSet *set4 = [NSSet setWithArray:arr];
        NSArray *arr1 =@[@"1",@"2",@"3"];
        NSSet *appSet1 = [set4 setByAddingObject:@"e"];
        NSLog(@"appSet1%@",appSet1);
        NSSet *appSet2 = [set4 setByAddingObjectsFromArray:arr1];
        NSLog(@"appSet2%@",appSet2);
        NSSet *appSet3 = [appSet2 setByAddingObjectsFromSet:set3];
        NSLog(@"appSet3%@",appSet3);
        
        
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    }
    return 0;
}

