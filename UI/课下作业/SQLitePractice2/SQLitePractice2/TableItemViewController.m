//
//  TableItemViewController.m
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "TableItemViewController.h"
#import "Person.h"
#import "CustomCell.h"
#import "UpdateViewController.h"

@interface TableItemViewController ()

@end

@implementation TableItemViewController
{
    NSMutableArray *itemList;
    Person *person;
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
    itemList = [[NSMutableArray alloc]init];
    person = [[Person alloc]init];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [itemList addObjectsFromArray:[[SQLiteManager defaultManager]itemListFromTalbe:self.tableName]];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [itemList removeAllObjects];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [itemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"itemCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    // Configure the cell...
    person = itemList[indexPath.row];
    cell.textLabel.text = person.pID;
    cell.detailTextLabel.text = person.pName;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[SQLiteManager defaultManager]removeItem:[itemList objectAtIndex:indexPath.row]];
        [itemList removeObjectAtIndex:indexPath.row];
 
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

//能够设置对应路径下的单元格是否显示菜单选项
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


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
    person.pID = [NSString stringWithFormat:@"%d",[itemList count]+ 1];
    person.pName = @"wangwan";
    person.pAge = @"35";
    [itemList addObject:person];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[itemList count]-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [[SQLiteManager defaultManager]insertItem:person andTableName:self.tableName];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Person *)sender
{
    UpdateViewController *updateVC = nil;
    updateVC = segue.destinationViewController;
    updateVC.person = sender;
}

#pragma mark - CustomCell Delegate
-(void)goToUpdate:(NSString *)pIDText
{
    [self performSegueWithIdentifier:@"detailToUpdate" sender:[[SQLiteManager defaultManager]findItem:pIDText]];
}
@end
