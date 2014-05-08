//
//  Singleton.h
//  UploadSample
//
//  Created by Lewis on 13-10-24.
//  Copyright (c) 2013年 www.lanou3g.com  北京蓝鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,assign) BOOL isUploading;
@property (nonatomic ,assign) BOOL isDownloading;
+ (Singleton *)instance;

@end
