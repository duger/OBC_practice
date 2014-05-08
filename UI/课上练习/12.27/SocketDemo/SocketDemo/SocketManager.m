//
//  SocketManager.m
//  SocketDemo
//
//  Created by Duger on 13-12-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SocketManager.h"

#define khostAddress @"124.205.147.26"
#define khostPort 9164


@interface SocketManager ()
{
    GCDAsyncSocket *_asyncSocket;
    BOOL connected;
    
    NSMutableData *restData;
}


@end

@implementation SocketManager

static  SocketManager *instance = nil;
+(SocketManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SocketManager alloc]init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        connected = NO;
        self.hostAddress = khostAddress;
        self.hostPort = khostPort;
    }
    return self;
}

//建立连接
-(NSError *)setupConnection{
    if (nil == _asyncSocket)
        _asyncSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        NSError *error = nil;
        NSLog(@"IP %@, port:%i",self.hostAddress,self.hostPort);
        [_asyncSocket connectToHost:self.hostAddress onPort:self.hostPort error:&error];
        if (error != nil) {
            @throw [NSException exceptionWithName:@"GCDAsyncSocket" reason:[error localizedDescription] userInfo:nil];
        }else
            error = nil;

    connected = YES;
    return error;
}


//判断是否是连接状态
-(BOOL)isConnected{
    return _asyncSocket.isConnected;
}

//断开连接
-(void)disConnect {
    connected = NO;
    [_asyncSocket disconnect];
}


//取得连接
-(void)getConnection{
    if (![_asyncSocket isConnected]) {
        [self disConnect];
        
        [self setupConnection];
    }
}

-(void)sendMessage:(NSString *)str
{
    NSString *content = [str stringByAppendingString:@"\r\n\r\n"];
    [_asyncSocket writeData:[content dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:3];
    NSLog(@"sending Message");
    
}


#pragma mark - Socket Delegate
//socket连接成功后的回调代理
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"onSocket:%p didConnectToHost:%@ port:%hu", sock, host, port);
    [self listenData];


}

//socket连接断开后的回调代理
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    
}

//读到数据后的回调代理
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"收到数据！！！%@",str);

}


-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    
}


//发起一个读取的请求，当收到数据时后面的didReadData才能被回调
-(void)listenData{
//    [_asyncSocket readDataToData:[GCDAsyncSocket LFData] withTimeout:-1 tag:0];
    [_asyncSocket readDataToData:[GCDAsyncSocket LFData] withTimeout:-1 maxLength:8192 tag:3];
}

//<p class="p1">NSMutableData<span style="font-family: Arial, Helvetica, sans-serif;">* restData;</span></p>//分割数据包
-(void)splitData:(NSData*)orignal_data {
    NSUInteger l = [orignal_data length];
    NSLog(@"Data length1 = %d",l);
    NSString* sp = @"\n";
    NSData* sp_data = [sp dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger sp_length = [sp_data length];
    NSUInteger offset = 0;
    int line = 0;
    while (TRUE) {
        NSUInteger index = [self indexOfData:sp_data inData:orignal_data offset:offset];
        if (NSNotFound == index) {
            if (offset<l) {
                NSLog(@"Have data not read");
                NSRange range = {offset,l-offset};
                NSData* rest = [orignal_data subdataWithRange:range];
                if (restData == nil) {
                    restData = [[NSMutableData alloc] init];
                }
                [restData appendData:rest];
            }
            return;
        }
        NSUInteger length = index + sp_length;
        NSRange range = {offset,length-offset};
        NSData* sub = [orignal_data subdataWithRange:range];
        if (restData != nil) {
            [restData appendData:sub];
//            [delegate readData:restData];
            restData = nil;
        } else {
            NSLog(@"line %d",line++);
//            [delegate readData:sub];
        }
        offset += length;
    }
}

//查找指定的数据包的位置
- (NSUInteger)indexOfData:(NSData*)needle inData:(NSData*)haystack offset:(NSUInteger)offset
{
    Byte* needleBytes = (Byte*)[needle bytes];
    Byte* haystackBytes = (Byte*)[haystack bytes];
    
    // walk the length of the buffer, looking for a byte that matches the start
    // of the pattern; we can skip (|needle|-1) bytes at the end, since we can't
    // have a match that's shorter than needle itself
    for (NSUInteger i=offset; i < [haystack length]-[needle length]+1; i++)
    {
        // walk needle's bytes while they still match the bytes of haystack
        // starting at i; if we walk off the end of needle, we found a match
        NSUInteger j=0;
        while (j < [needle length] && needleBytes[j] == haystackBytes[i+j])
        {
            j++;
        }
        if (j == [needle length])
        {
            return i;
        }
    }
    return NSNotFound;
}


@end
