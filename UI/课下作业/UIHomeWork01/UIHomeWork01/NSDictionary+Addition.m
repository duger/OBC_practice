//
//  NSDictionary+Addition.m
//  UIHomeWork01
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSDictionary+Addition.h"

@implementation NSDictionary (Addition)
-(NSDictionary *)reverse
{
    id key[[self count]];
    id value[[self count]];
    [self getObjects:value andKeys:key];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithObjects:key forKeys:value count:[self count]];
    return [dic autorelease];

}
@end
