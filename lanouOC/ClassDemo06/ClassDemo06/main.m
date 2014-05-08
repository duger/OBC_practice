//
//  main.m
//  ClassDemo06
//
//  Created by Duger on 13-9-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray  *arr = @[@"323",@"fee"];
        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"string",@"object1",arr,@"object2",@"dictionary",@"object3",@"8", @"A", nil];
        NSLog(@"%@",dic);
        NSLog(@"%@",[dic objectForKey:@"object2"]);
        NSLog(@"%@",[dic allKeys]);
        NSLog(@"%@",[dic allValues]);
        id *arr1 = malloc(sizeof(id) * 3);
        id *arr2 = malloc(sizeof(id) * 3);
        [dic getObjects:arr1 andKeys:arr2];
//        NSLog(@"getBbjects :%@",arr2[0]);
        
        for (id object in dic) {
//            NSLog(@"%@", [dic objectForKey:object]);
        }
        
        NSDictionary *myDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"4", @"A", @"2", @"B", nil];
        
        NSInteger count = [myDictionary count];
        id objects[count];
        id keys[count];
        [myDictionary getObjects:objects andKeys:keys];
        
        for (int i = 0; i < count; i++) {
            id obj = objects[i];
            id key = keys[i];
            NSLog(@"%@ -> %@", obj, key);
        }
        
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]initWithDictionary:dic];
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc]initWithDictionary:myDictionary];
    [dic1 addEntriesFromDictionary:dic2];
    NSLog(@"%@",dic1 );
    [dic1 setDictionary:dic2];
        NSLog(@"%@",dic1 );
        
        NSLog(@"%@",[dic1 class]);
        NSLog(@"%@",NSStringFromClass([dic2 class]));
//        NSMutableDictionary *dic3 = [NSMutableDictionary dictionaryWithSharedKeySet:*arr2];
        
//        id *arr3 = malloc(sizeof(id) * 2);
       
        NSSet *set = [NSSet setWithObjects:keys count:2];
        NSLog(@"%@",set);
        NSSet *set1 = [NSSet set];
        NSArray *arr3 = [[NSArray alloc]initWithObjects:@"abc",@"def",@"hij", nil];
        [set1 setByAddingObjectsFromArray:arr3];
//        [set1 initWithArray:arr3];
        NSLog(@"set1 :%@",set1);
        NSSet *set2 = [[NSSet alloc]initWithObjects:@[@"323",@"fee"],@"wang",@"zhang", nil];
        NSLog(@"set2 :%@",set2);
        NSLog(@"count:%ld",[set2 count]);
        NSLog(@"all:%@",[set2 allObjects]);
        NSLog(@"any:%@",[set2 anyObject]);
        [set2 setByAddingObjectsFromArray:arr3];
        NSLog(@"fromArray:%@",set2);
        NSLog(@"member: %@",[set2 member:@"wan"]);
        NSLog(@"Decription: %@",[set2 descriptionWithLocale:dic]);
        NSNumber *num = [NSNumber numberWithInt:35];
        printf("%f",[num floatValue]);

    }
    return 0;
}

