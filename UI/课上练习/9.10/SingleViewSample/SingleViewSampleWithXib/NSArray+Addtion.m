//
//  NSArray+Addtion.m
//  SingleViewSample
//
//  Created by Duger on 13-9-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSArray+Addtion.h"

@implementation NSArray (Addtion)
-(NSArray *)reverse
{
    if ([self count] <= 1) {
        return self;
    }
    
    
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (int index = [self count] - 1; index >= 0; index--) {
        [result addObject:[self objectAtIndex:index]];
    }
    return [result autorelease];
}
@end
