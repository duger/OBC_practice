//
//  WFViewController.m
//  ThreadSample
//
//  Created by Duger on 13-10-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "NSThread+Additons.h"

@interface WFViewController ()

//线程方法
-(void)_threadMethod:(id)sender;
//主线程刷新方法
-(void)_refreshOnMainThread;
@end



@implementation WFViewController
{
    NSThread *thread;
    dispatch_queue_t queue;
    dispatch_source_t source_queue;
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
    [super dealloc];
}
- (IBAction)didClickButton:(UIButton *)sender {
    //刷新文本框内的内容
//    [self _refreshOnMainThread];
    //创建子线程，并且制定子线程处理的事务
    
    //1.只能创建子线程，不能完成暂停、恢复、取消子线程操作
//    [self performSelectorInBackground:@selector(_threadMethod:) withObject:nil];
    
    //2.只能创建子线程，不能完成暂停、恢复、取消子线程操作
//    [NSThread detachNewThreadSelector:@selector(_threadMethod:) toTarget:self withObject:nil];
    
    //3.
  if ([[[sender titleLabel]text]isEqualToString:@"Start"]) {
        thread = [[NSThread alloc]initWithTarget:self selector:@selector(_threadMethod:) object:nil];
        //启动线程
        [thread start];
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }else
//    {
//        [thread cancel];
//        [sender setTitle:@"Start" forState:UIControlStateNormal];
//    }
  

    
    if ([sender.titleLabel.text isEqualToString:@"Suspend"]) {
    
        //取消线程
        [thread suspend];
//        [thread release],thread = nil;
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        
    }else
    
    if ([sender.titleLabel.text isEqualToString:@"Resume"]) {
        
        //取消线程
        [thread resume];
//        [thread release],thread = nil;
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }

    
    //4.操作队列
/*    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(_threadMethod:) object:nil];
    //将事务添加到操作队列内
    [queue addOperation:operation];
 * /
    //5.DCD
 /*   dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //添加事务
    dispatch_async(queue, ^{
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
    });
    //添加事务
    dispatch_async(queue, ^{
        while (1) {
            [NSThread sleepForTimeInterval:10.0f];
        }
        [[NSRunLoop currentRunLoop]run];
    });
    
*/
    
    //5.
 /*   if ([sender.titleLabel.text isEqualToString:@"Start"]) {
        queue = dispatch_queue_create("gaofushuai", NULL);
        source_queue = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(source_queue, dispatch_time(0, 0), 1 * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(source_queue, ^{
            [self _timerMethod];
        });
        dispatch_resume(source_queue);
        //添加第一个事务
//        dispatch_async(queue, ^{
//            [NSThread sleepForTimeInterval:10.0f];
//        });
//        
//        dispatch_async(queue, ^{
//            [self _threadMethod:nil];
//        });
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqualToString:@"Suspend"]){
        dispatch_suspend(source_queue);
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
    }else if ([sender.titleLabel.text isEqualToString:@"Resume"]){
        dispatch_suspend(source_queue);
        [sender setTitle:@"Suspend" forState:UIControlStateNormal];
    }
    
//    dispatch_suspend(queue);
  */  
}


#pragma mark - private method
-(void)_threadMethod:(id)sender
{
    //通过让线程休眠，模拟大数据处理或者是网络请求数据
//    [NSThread sleepForTimeInterval:3.0f];
    //添加定时器，每隔1秒添加事件
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerMethod) userInfo:nil repeats:YES];
    //添加循环等待用户响应
    [[NSRunLoop currentRunLoop] run];

}

-(void)_timerMethod
{
    
    if ([[NSThread currentThread] isCancelled]) {
        [NSThread exit];
    }
    //通过让线程休眠，模拟大数据处理或者是网络请求数据
    [NSThread sleepForTimeInterval:3.0f];
    //主线程中修改文本编辑框中的文字
    [self performSelectorOnMainThread:@selector(_refreshOnMainThread) withObject:nil waitUntilDone:YES];
}

//主线程刷新方法
-(void)_refreshOnMainThread
{
    NSString *text = self.textView.text;
    NSString *date = [[NSDate date]description];
    text = [text stringByAppendingFormat:@"\n%@",date];
    self.textView.text = text;
}

@end
