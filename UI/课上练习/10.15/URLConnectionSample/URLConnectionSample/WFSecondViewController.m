//
//  WFSecondViewController.m
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFSecondViewController.h"

@interface WFSecondViewController ()

@end

@implementation WFSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
- (IBAction)didClickButton:(UIButton *)sender {
    //中国天气网的链接地址
    //url中包含？字符，代表客户端将会发起get请求，请求的参数是赋值符号的左边的变量名，请求的参数的值是赋值符号右边的常量，&是连接符
    NSString *cities = @"http://www.google.com/ig/cities?hl=en&country=jp&charset=en-GB";
    NSString *imageURL = @"http://e.hiphotos.baidu.com/pic/w%3D2048/sign=a00f861518d8bc3ec60801cab6b3a71e/8694a4c27d1ed21bc27a1dcaac6eddc451da3f69.jpg";
    //通过网络地址url字符串，创建NSURL对象
    NSURL *url = [NSURL URLWithString:imageURL];
    
    //通过URL对象，创建请求对象
    //NSURLRequest的实例对象，不能够设置http协议中的HeaderFields字段，不能够设置http协议使用的方法（get，post,delete,put);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //通过NSURLRequset对象，创建链接对象
    //可以发起两种不同方式的链接,客户端两种不同方式，和客户端与服务器交互无关
    //1.同步请求
    NSURLResponse *response =nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    UIImage *image = [UIImage imageWithData:data];
    self.imageView.image = image;
    NSLog(@"%@",[response description]);
    
    
}
@end
