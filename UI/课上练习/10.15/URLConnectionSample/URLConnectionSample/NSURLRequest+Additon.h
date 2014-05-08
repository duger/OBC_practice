//
//  NSURLRequest+Additon.h
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (Additon)

+(NSURLRequest *)requestWithString:(NSString *)urlString;

@end

@interface NSMutableURLRequest (Additon)
+(NSMutableURLRequest *)mutableRequestWithString:(NSString *)urlString;
@end