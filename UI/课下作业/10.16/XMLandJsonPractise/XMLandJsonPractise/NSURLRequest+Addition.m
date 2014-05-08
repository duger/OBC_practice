//
//  NSURLRequest+Addition.m
//  XMLandJsonPractise
//
//  Created by Duger on 13-10-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSURLRequest+Addition.h"

@implementation NSURLRequest (Addition)
+(NSURLRequest *)requestWithString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    return [NSURLRequest requestWithURL:url];
    
}

@end
