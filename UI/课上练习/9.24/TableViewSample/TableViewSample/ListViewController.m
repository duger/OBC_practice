//
//  ListViewController.m
//  TableViewSample
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ListViewController.h"
#import "CustomCell.h"

static inline NSString *getResourcePath()
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat:@"/%@",@"Resource"];
}
@interface ListViewController ()
@property(nonatomic,retain) NSMutableArray *itemList;

@end

@implementation ListViewController

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
	// Do any additional setup after loading the view.
    

    UIColor *color = [UIColor colorWithRed:arc4random()%1001 / 1000.0f green:arc4random()%1001 / 1000.0f blue:arc4random()%1001 / 1000.0f alpha:1];
    
    //实例化表格式图
    UITableView *listView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //分割线的颜色
    listView.separatorColor = color;
    //分割线的样式
    listView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //表格视图的行高
    listView.rowHeight = 53.0f;
    [self.view addSubview:listView];
    [listView release];
    
    //设置表格式图的数据源
    listView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //表格视图内会显现3行的数据
    return [self.itemList count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = nil;
    //设置单元格
    //1.声明单元格的唯一标示符
    static NSString *cellName = @"cellName";
    //2.通过唯一标示符在表格视图内获取一个重用的已经被重用的（清理干净的）单元格
    cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    //3.假如真没有获取到单元格,就要实例化单元格
    if (cell == nil) {
        cell = [[[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName] autorelease];
        NSLog(@"创建");
        
    }else{
         NSLog(@"重用重用%p",cell);
    }
    
    switch (indexPath.row % 3) {
        case 0:
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case 1:
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case 2:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        default:
            break;
    }
    
    
    NSDictionary *itemDic = [self.itemList objectAtIndex:indexPath.row];
    NSString *fileName = [itemDic objectForKey:@"name"];
    UIImage *image = [itemDic objectForKey:@"image"];
    
//    cell.imageView.image = image;
//    cell.textLabel.text = fileName;
    cell.customImageView.image = image;
    cell.customLabel.text = fileName;
   
//    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
    
}

-(NSMutableArray *)itemList
{
    if (_itemList == nil) {
        _itemList = [[NSMutableArray alloc]init];
        
        //添加数据
        //2250_3650903_179fb89ae279fae－2（被拖移）.tiff
        for (NSInteger index = 1; index <= 40; index++) {
            NSString *fileName = [[NSString alloc]initWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）.tiff",index];
            NSString *filePath = [[NSString alloc]initWithFormat:@"%@/%@",getResourcePath(),fileName ];
            UIImage *image = [[UIImage alloc]initWithContentsOfFile:filePath];
            
            NSMutableDictionary *itemDic = [[NSMutableDictionary alloc]init];
            [itemDic setObject:image forKey:@"image"];
            [itemDic setObject:fileName forKey:@"name"];
            [_itemList addObject:itemDic];
            [itemDic release];
            [fileName release];
            [filePath release];
            [image release];
        }
        
    }
    
    
    return _itemList;
}


@end
