//
//  Singleton.m
//  UploadSample
//
//  Created by Lewis on 13-10-24.
//  Copyright (c) 2013年 www.lanou3g.com  北京蓝鸥科技有限公司. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *s_Singleton = nil;
+ (Singleton *)instance
{
    @synchronized(self)
    {
        if (s_Singleton == nil) {
            s_Singleton = [[Singleton alloc] init];
        }
    }
    return s_Singleton;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.isUploading = NO;
        self.isDownloading = NO;
    }
    return self;
}

- (void)setContent:(NSString *)content
{
    //内存管理有问题的
    _content = [content copy];
    
    //通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kUploadSuccessedNotification  object:nil];
}
@end
