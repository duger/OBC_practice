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
    
    //实例化编辑item
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(didClickEditItem:)];
    
    [self.navigationItem setRightBarButtonItem:editItem animated:YES];
    [editItem release];

    UIColor *color = [UIColor colorWithRed:arc4random()%1001 / 1000.0f green:arc4random()%1001 / 1000.0f blue:arc4random()%1001 / 1000.0f alpha:1];
    
    //实例化表格式图
    UITableView *listView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    listView.tag = 1001;
    //分割线的颜色
    listView.separatorColor = color;
    //分割线的样式
    listView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //表格视图的行高
    listView.rowHeight = 53.0f;
    //
    listView.delegate = self;
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
#pragma mark - Private Methods

-(void)didClickEditItem:(UIBarButtonItem *)item
{
    UITableView *listView = (UITableView *)[self.view viewWithTag:1001];
    [listView setEditing:!listView.isEditing animated:YES];
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
        for (NSInteger index = 1; index <= 5; index++) {
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//返回对应group的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [@(section) description];
}

//能够设置对应group的页脚
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"版权归我所有！";
}
//能够设置对应路径下的单元格是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *arr = @[@"1",@"2",@"3",@"4"];
    return arr;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
//            [tableView beginUpdates];
//            
//            [self.itemList removeObjectAtIndex:indexPath.row];
//            NSIndexPath *firstPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
//            NSIndexPath *secondPath = [NSIndexPath indexPathForRow:indexPath.row inSection:1];
//            [tableView deleteRowsAtIndexPaths:@[firstPath,secondPath] withRowAnimation:UITableViewRowAnimationAutomatic];
////            [tableView deleteRowsAtIndexPaths:@[secondPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            [tableView endUpdates];
            break;
        case UITableViewCellEditingStyleInsert:
            [tableView beginUpdates];
            NSString *fileName = [[NSString alloc]initWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）.tiff",1];
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
//            [self.itemList addObjectAtIndex:indexPath.row];
            NSIndexPath *firstPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            NSIndexPath *secondPath = [NSIndexPath indexPathForRow:indexPath.row inSection:1];
            [tableView insertRowsAtIndexPaths:@[firstPath,secondPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            //            [tableView deleteRowsAtIndexPaths:@[secondPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [tableView endUpdates];
            
            break;
        case UITableViewCellEditingStyleNone:
            ;
            break;
            
        default:
            break;
    }
}


#pragma mark - UITableView  Delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",[indexPath description]);
    
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",[indexPath description]);
}

//设置单元格的格式
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

//设置标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120.0f;
    
}


//设置标题视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *fileName = @"huoju_2.tiff";
    NSString *filePath = [getResourcePath() stringByAppendingFormat:@"/%@",fileName];
    
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:filePath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [image release];
    
    UIView *contView = [[UIView alloc]init];
    contView.center = CGPointMake(CGRectGetMidX(contView.bounds), 0);
    [contView addSubview:imageView];
    [imageView release];
    return [contView autorelease];
 
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"温馨提示" delegate:nil cancelButtonTitle:@"Canal" destructiveButtonTitle:@"hahah" otherButtonTitles:@"OK", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        indexPath = [NSIndexPath indexPathForRow:1 inSection:indexPath.section];
    }
    return indexPath;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"你好" message:@"该吃饭了" delegate:nil cancelButtonTitle:[NSString stringWithFormat:@"%d",indexPath.section] otherButtonTitles:[NSString stringWithFormat:@"%d",indexPath.row], nil];
//    [alertView show];
    [alertView release];
    
    UITableViewCell *cell = nil;
    cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setEditing:!cell.isEditing animated:YES];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"你好" message:@"你丫傻逼" delegate:nil cancelButtonTitle:[NSString stringWithFormat:@"%d",indexPath.section] otherButtonTitles:[NSString stringWithFormat:@"%d",indexPath.row], nil];
//    [alertView show];
    [alertView release];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == ([self.itemList count] - 1)) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}





@end
