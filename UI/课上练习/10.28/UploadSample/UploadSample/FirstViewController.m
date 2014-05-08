//
//  FirstViewController.m
//  UploadSample
//
//  Created by Lewis on 13-10-17.
//  Copyright (c) 2013年 www.lanou3g.com  北京蓝鸥科技有限公司. All rights reserved.
//

#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>

static inline NSData *viewData(UIView *view)
{
    //开始截图画布
    UIGraphicsBeginImageContext(view.bounds.size);
    //将视图渲染到画布
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //从画布上获取对应的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //结束截图画布
    UIGraphicsEndImageContext();
    
    return UIImageJPEGRepresentation(image, 1.0f);
}

@interface FirstViewController ()

@end
@implementation FirstViewController
{
    //报体长度
    NSInteger       bodyLength;
    //服务器返回数据时用到的变量
    NSMutableData   *mutableData;
    //当前视图控制器是否处于显示状态
    BOOL            isShowing;
    //分割线啊啊啊啊啊啊
    NSString        *boundary;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    //我是分割线
    boundary = [NSString stringWithFormat:@"----------------%d---------",(int)[[NSDate date] timeIntervalSince1970]];
}


- (NSData *)body
{
    NSData *musicData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ab" ofType:@"mp3"]];

    //上传日期
    NSDate *date = [NSDate date];
    
    //字符串内..Content-Disposition用来定义当Http协议报头数据类型为multipart/form-data时的，每一个附件的具体行为
    //name:定义在服务器中获取对应文件或文本时的key
    //filename:如果定义的话，则将对应数据存放到缓存文件内，等待服务器处理
    //如果没有定义的话，则将对应数据做为POST请求的对应key的参数,key就是上边用到的name属性
    NSString *content_Disposition_mp3 = [NSString stringWithFormat:@"Content-Disposition: attachment; name=\"musicfile\"; filename=\"%d.mp3\"\r\n",(int)[date timeIntervalSince1970]];
    NSString *content_Disposition_image = [NSString stringWithFormat:@"Content-Disposition: attachment; name=\"imagefile\"; filename=\"%d.png\"\r\n",(int)[date timeIntervalSince1970] + 2];
    NSString *content_Dispostion_text = [NSString stringWithFormat:@"Content-Disposition: attachment; name=\"text\";\r\n"];
    //注意上边的3个name一定不相同，因为在服务器获取数据时,通过name来区分有几个参数,name是不可以重复的

    //发送body内的内容类型,流体,不用变
    NSString *content_Type = @"Content-Type: application/octet-stream\r\n\r\n";
    NSMutableData *body = [NSMutableData data];
    
    /*-------------------------------------------------------------------*/
    //第一个参数,是音乐数据,以\r\n--boundary\r\n开头
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数形式
    [body appendData:[content_Disposition_mp3 dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数类型
    [body appendData:[content_Type dataUsingEncoding:NSUTF8StringEncoding]];
    //添加真实数据
    [body appendData:musicData];
    
    /*-------------------------------------------------------------------*/
    //第二个参数,是图片数据,以\r\n--boundary\r\n分割
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数形式
    [body appendData:[content_Disposition_image dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数类型
    [body appendData:[content_Type dataUsingEncoding:NSUTF8StringEncoding]];
    //添加真实数据
    [body appendData:viewData(self.view)];
    
    /*-------------------------------------------------------------------*/
    //第三个参数,是图片数据,以\r\n--boundary\r\n分割
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数形式
    [body appendData:[content_Dispostion_text dataUsingEncoding:NSUTF8StringEncoding]];
    //设置参数类型
    [body appendData:[content_Type dataUsingEncoding:NSUTF8StringEncoding]];
    //添加真实数据
    [body appendData:[@"我是传的文本数据" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    /*-------------------------------------------------------------------*/
    //最后一个标记,以\r\n--boundary--\r\n,多了两个-
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [musicData release];
    return body;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        //添加注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didReceiveNotification) name:kUploadSuccessedNotification object:nil];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = kRandomColor;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //视图显示时,设置显示状态为YES
    isShowing = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //视图隐藏时,设置显示状态为NO
    isShowing = NO;
}


- (void)_upload
{
    if ([Singleton instance].isUploading) {
        return;
    }
    [Singleton instance].isUploading = ![Singleton instance].isUploading;
    self.view.backgroundColor = kRandomColor;
    
    NSURL *url = [NSURL URLWithString:kManagerUpload_URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    //文件格式
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSData *body = [self body];
    [request setHTTPBody:body];
    
    bodyLength = body.length;
    //异步实现上传文件
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    [self.progressView setProgress:0.0f animated:YES];
    mutableData = [[NSMutableData alloc] init];
    return request;
}

//获取发送的进度
- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    CGFloat progress = (CGFloat)totalBytesWritten / bodyLength;
    [self.progressView setProgress:progress animated:YES];
    //显示进度
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f",progress];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mutableData appendData:data];
}

//上传成功
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *content = [[NSString alloc] initWithData:mutableData encoding:NSUTF8StringEncoding];
    [Singleton instance].content = content;
    [self.progressView setProgress:1.0f animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_progressView release];
    [_progressLabel release];
    [super dealloc];
}
- (IBAction)didClickUpload:(id)sender {
    [self _upload];
}

#pragma mark - 上传成功的通知
- (void)_didReceiveNotification
{
    if (isShowing) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示！！" message:@"文件已经上传成功,请点击第二个控制器查看服务器返回结果" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
    }
}

#pragma mark - alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            break;
        default:
        {
            [self.tabBarController setSelectedIndex:1];
            break;
        }
    }
}

@end
