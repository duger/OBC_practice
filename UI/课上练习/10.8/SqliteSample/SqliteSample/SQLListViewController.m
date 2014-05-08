//
//  SQLListViewController.m
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SQLListViewController.h"
#import "Person.h"
//#import "DAContextMenuCell.h"
#import "CustomCell.h"
#import "UpdateViewController.h"

@interface SQLListViewController ()

@end

@implementation SQLListViewController
{
    NSMutableArray *personList;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    personList = [[NSMutableArray alloc]init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [personList addObjectsFromArray:[[SqliteManager singleton] itemListFromTable:@"Person"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"删除时count%d",[personList count]);
    return [personList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"listCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    Person *person = [personList objectAtIndex:indexPath.row];
//    Person *person = personList[indexPath.row];
    cell.textLabel.text = person.pid;
    cell.detailTextLabel.text = person.pname;
    cell.delegate = self;
    return cell;
}

//能够设置对应路径下的单元格是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView beginUpdates];
        Person *person = [[Person alloc]init];
        [[SqliteManager singleton]remove:person andIndex:indexPath.row + 1];
#pragma mark //        [person release];
        [personList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    
}

- (IBAction)didClickAdd:(UIBarButtonItem *)sender {
    Person *person = [[Person alloc]init];
    person.pid = [NSString stringWithFormat:@"%d",[personList count] + 1];
    person.pname = @"wangfu";
    person.page = [NSString stringWithFormat:@"46"];
    [personList addObject:person];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[personList count] - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //直接reloaddata没有动画效果
//    [self.tableView reloadData];
    [[SqliteManager singleton] insert:person];
//  [person release];
    
}

//能够设置对应路径下的单元格是否显示菜单选项
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
//{
//    if (action == @selector(didClickEdit:)) {
//        //实现方法
//    }
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString *)sender
{
    UpdateViewController *updateVC = nil;
    updateVC = segue.destinationViewController;
    updateVC.pId = sender;
    
}


#pragma mark - CustomCell Delegate
-(void)gotoUpdate:(NSString *)text
{
    [self performSegueWithIdentifier:@"fromTableViewToDetail" sender:text];
}

@end
