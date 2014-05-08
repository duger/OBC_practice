//
//  main.m
//  TestAPI
//
//  Created by Duger on 13-10-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...

#define API @"http://124.205.147.26/student/class_10/team_seven/download/downloadRece.php"
        
        NSMutableString *realURL = [[NSMutableString alloc]init];
        [realURL appendString:API];
//        [realURL appendFormat:@"?"];
//        [realURL appendString:@"name=lanou"];
        
        NSURL *url = [NSURL URLWithString:realURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *r, NSData *data, NSError *error) {
            NSString *content = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",content);

        }];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

