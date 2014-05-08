//
//  NSURLRequest+Additon.m
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSURLRequest+Additon.h"

@implementation NSURLRequest (Additon)
+(NSURLRequest *)requestWithString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    return [NSURLRequest requestWithURL:url];
}


@end

@implementation NSMutableURLRequest (Additon)

+(NSMutableURLRequest *)mutableRequestWithString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    return [NSMutableURLRequest requestWithURL:url];
}
@end
