//
//  ThirdViewController.m
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickButton:(UIButton *)sender {
    //举例POST
    NSMutableURLRequest *request = [NSMutableURLRequest mutableRequestWithString:@"http://www.google.com/ig/cities"];
    //设置http协议使用的方法
    [request setHTTPMethod:@"POST"];
    //设置网络请求从客户端发送给服务器的信息
    //客户端发送POST请求时，使用xml格式的字符串数据进行发送
    //xml格式
    //以<?xml version ="1.0" encoding = "utf-8">开头
    //中间每个元素包含开闭标签，开标签<元素名称>，闭标签<元素名称/>
    //xml头是需要记住的。
    NSString *content = @"<?xml version=\"1.0\"encoding=\"utf-8\" ?><root><hl>en</hl><country>cn</country></root>";
    [request setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];
    //其余和get一样
    //同步请求
     NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //我们不能把握服务器能够解析我们发出的xml信息， 服务器端 应该提供健全的接口文档。是前端开发人员能够正确的配置xml给服务器
    
    
}
@end
