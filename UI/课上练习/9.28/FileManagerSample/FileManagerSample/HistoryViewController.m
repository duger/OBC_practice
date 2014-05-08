//
//  HistoryViewController.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "HistoryViewController.h"
#import "ShiBan.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
{
    //图片
    NSMutableArray *imageArray;
    //存储文件的名字
    NSMutableArray *textArray;
    //存储对象的名字
    NSMutableArray *objectArray;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    imageArray = [[NSMutableArray alloc]init];
    textArray = [[NSMutableArray alloc]init];
    objectArray = [[NSMutableArray alloc]init];
}

static NSString *imageCell = @"ImageCell";
static NSString *textCell = @"TextCell";
static NSString *objectCell = @"ObjectCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView *tableView = (UITableView *)[self.view.subviews lastObject];
    
    //注册单元格
    [tableView registerClass:NSClassFromString(imageCell) forCellReuseIdentifier:imageCell];
    //注册单元格
    [tableView registerClass:NSClassFromString(textCell) forCellReuseIdentifier:textCell];
    //
    [tableView registerClass:NSClassFromString(objectCell) forCellReuseIdentifier:objectCell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [imageArray release];
}

- (void)dealloc
{
    [objectArray release];
    [imageArray release];
    [textArray release];
    [super dealloc];
}

#pragma mark rewrite 
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //获取图片文件夹内的文件名
    NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[UIImage imageAtDocumentPath] error:nil];
    //将获取的图片添加到图片数组内
    [imageArray addObjectsFromArray:array];
    
    //获取文本文件夹内的文件
    NSArray *txtArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSDictionary textAtDocumentPath] error:nil];
    //将获取的数组添加到文本数组内
    [textArray addObjectsFromArray:txtArray];
    
        
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UITableView *tabeVeiw = (UITableView *)[self.view.subviews lastObject];
    
    //声明路径
    NSMutableArray *indexPaths = [[NSMutableArray alloc]init];
    
    for (UITableViewCell *cell in [tabeVeiw visibleCells]) {
        //通过单元格获取单元格的路径 并且输出
        [indexPaths addObject:[tabeVeiw indexPathForCell:cell]];
    }
    //刷新对应的单元格，使用渐渐的动画
    [tabeVeiw reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [indexPaths release];
}


#pragma mark - UITableVeiwDataSource Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0: //图片
        {   return [imageArray count];
            
        }
        case 1: //文字
        {
            return [textArray count];
            
        }
            
        case 2: //对象
        {   return 5;
            
        }
        default:
            break;
    }
return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:imageCell];
            //设置单元格的文字是对应的图片的名字
            cell.textLabel.text = [imageArray objectAtIndex:indexPath.row];
            
            //获取文件名
            NSString *fileName = [imageArray objectAtIndex:indexPath.row];
            //获取文件路径
            NSString *filePath = [[UIImage imageAtDocumentPath] stringByAppendingFormat:@"/%@",fileName];
            
            if ([fileName hasSuffix:@"stu"]) {
                NSLog(@"%@",[[ShiBan alloc] initWithContentOfFile:filePath]);
            }

            
            break;
        }
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"];
            NSString *fileName = [textArray objectAtIndex:indexPath.row];
            
            NSString *filePath = [[NSDictionary textAtDocumentPath] stringByAppendingFormat:@"/%@",fileName];
            //读取内容
            NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
            cell.textLabel.text = [dic objectForKey:@"name"];
            cell.detailTextLabel.text = [dic objectForKey:@"content"];
            
            break;
        }
            
        case 2:
        {   cell = [tableView dequeueReusableCellWithIdentifier:@"ObjectCell"];

            break;
        }
        default:
            break;
    }

    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

@end
