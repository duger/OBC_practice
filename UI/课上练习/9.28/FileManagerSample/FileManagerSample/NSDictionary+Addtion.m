//
//  NSDictionary+Addtion.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "NSDictionary+Addtion.h"

@implementation NSDictionary (Addtion)
+(NSString *)textAtDocumentPath
{
    //获取DocumentS路径
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //获取程序默认创建的文件路径
    NSString *documentPath = [documents lastObject];
    //判断默认文件路径内是否有image文件夹
    //NSFileManage
    //创建对应的image文件夹路径
    NSString *imagePath = [documentPath stringByAppendingFormat:@"/Text"];
    
    //判断对应路径是否存在该文件夹，如果不存在则新建文件夹
    if (![[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:imagePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return imagePath;
}
@end
