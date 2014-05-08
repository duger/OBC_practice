//
//  WFFirstViewController.m
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFFirstViewController.h"

#define kCityURL @"http://www.google.com/ig/cities?hl=en&country=jp&charset=en-GB"
#define kMusicURL @"http://zhangmenshiting.baidu.com/data2/music/87961411/876032871381759261128.mp3?xcode=416a3d42472ac54f8157cd33aa93eb2d56455ae8496547ff"

@interface WFFirstViewController ()

@end

@implementation WFFirstViewController
{
    NSMutableData *mutalbeData;
    //声明私有变量，用来记录网络文件大小
    NSNumber *fileWeight;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
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
    [_textView release];

    [_customSwitch release];
    [_progressView release];
    [super dealloc];
}
- (IBAction)didClickButton:(UIButton *)sender {
    if (!self.customSwitch.isOn) {
        
        //异步请求方式1、
 /*       [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithString:kCityURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSString *content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            self.textView.text = content;
            [content release];
        }];
   */
        //异步请求方式2、
        [NSURLConnection connectionWithRequest:[NSURLRequest requestWithString:kCityURL] delegate:self];
        
        //异步请求方式3
 /*       //创建复杂请求对象
        NSMutableURLRequest *mutableRequest = [NSMutableURLRequest mutableRequestWithString:kMusicURL];
        //设置复杂请求的属性，简单请求不能设置
        //默认GET
        [mutableRequest setHTTPMethod:@"GET"];  //post put
        //设置http协议发送的数据头（header）
        //学名HeaderFields
        //例 2 Accept—Language：en-US
        [mutableRequest setValue:@"en-US" forHTTPHeaderField:@"Accept-Language"];
//        [mutableRequest setValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>];
//        [mutableRequest addValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>];
        //两个方法，set和add的区别
        //1.set方法：当请求内没有对应的HeaderField字段时，添加该字段，并且设置该字段断的值为value的参数；当请求内包含对应HeaderField字段时，将最后一次设置的Value的值作为该字段的参数；
        //2.add方法：当请求内没有对应的HeaderField字段时，添加该字段，并且设置该字段断的值为value的参数；当请求内包含对应HeaderField字段时，将每一次设置的Value的值作为该字段的参数；
        
        //注意：HeaderField已经规定好了。
        //设置完网络请求，启动链接发送请求
        [NSURLConnection connectionWithRequest:mutableRequest delegate:self];
        return;
  */
  
    }
  /*
    //中国天气网的链接地址
    //url中包含？字符，代表客户端将会发起get请求，请求的参数是赋值符号的左边的变量名，请求的参数的值是赋值符号右边的常量，&是连接符
    NSString *cities = @"http://www.google.com/ig/cities?hl=en&country=jp&charset=en-GB";
    NSString *music = @"http://zhangmenshiting.baidu.com/data2/music/87961411/876032871381759261128.mp3?xcode=416a3d42472ac54f8157cd33aa93eb2d56455ae8496547ff";
    //通过网络地址url字符串，创建NSURL对象
    NSURL *url = [NSURL URLWithString:cities];
    
    //通过URL对象，创建请求对象
    //NSURLRequest的实例对象，不能够设置http协议中的HeaderFields字段，不能够设置http协议使用的方法（get，post,delete,put);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //通过NSURLRequset对象，创建链接对象
    //可以发起两种不同方式的链接,客户端两种不同方式，和客户端与服务器交互无关
    //1.同步请求
    NSURLResponse *response =nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSString *content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.textView.text = content;
    [content release];
    NSLog(@"%@",[response description]);
  */  
    
}
- (IBAction)didChangeThread:(UISwitch *)sender {
}

#pragma mark - URLConnection Delegate
//用来处理重定向请求
//没有重定向，直接return request
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    return request;
}

//发送请求成功后，服务器做出的第一反应
//http协议，不是面向链接的。
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //在接受服务器应答的时候，如果发送网络请求使用的是http协议，则HSURLResponse这个数据类型的返回参数，一定是她的一个子类的实例对象，这个子类是NSHTTPPURLResponse
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //网络请求有很多种协议，不止http，列如ftp等等
    //http协议请求服务器，获得的服务器应答是固定格式的，而且是很常见的，可以通过应答的某些header字段获取想要的值，如文件大小
    //对应的key,同样是response的一个headerField
    //虽然request和response的headerField中同样包含，列如Content-Length 和Content-Type等相同的字符串的字段，但是代表的含义是完全不同的。
    fileWeight = [[httpResponse allHeaderFields]objectForKey:@"Content-Length"];
    NSLog(@"字典里有啥呢%@",[[httpResponse allHeaderFields]description]);
    mutalbeData = [[NSMutableData alloc]init];
}
//服务器开始通过网络返回客户端请求的结果
//断断续续的
int i = 0;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //接收地址
    [mutalbeData appendData:data];
    NSLog(@"接收次数：%d",++i);
    //收到一段数据后，计算当前的进度
    CGFloat progress = (CGFloat)[mutalbeData length] / [fileWeight integerValue];
    //progress是0 - 1 的
    self.progressView.progress = progress;
    
}

//当前一次网络请求结束
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //下载结束后，进度等于1.
    self.progressView.progress = 1.0f;
    //
    NSString *content = [[NSString alloc]initWithData:mutalbeData encoding:NSUTF8StringEncoding];
    self.textView.text = content;
    [content release];
    //
//    NSString *doucment = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *filePath = [doucment stringByAppendingFormat:@"/%@.avi",@"非你莫属"];
//    //保存文件
//    [mutalbeData writeToFile:filePath atomically:YES];
    
    
}
@end
