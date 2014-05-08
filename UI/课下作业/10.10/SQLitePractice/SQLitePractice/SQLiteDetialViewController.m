//
//  SQLiteDetialViewController.m
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SQLiteDetialViewController.h"
#import "Person.h"
#import "UpdateViewController.h"

@interface SQLiteDetialViewController ()

@end

@implementation SQLiteDetialViewController
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
    personList = [[NSMutableArray alloc]init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.tableView reloadData];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [personList removeAllObjects];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [personList addObjectsFromArray:[[SQLiteManager defaultManager]itemListFromTable:self.tableName]];
    NSLog(@"载入时%d",[personList count]);
    [self.tableView reloadData];
    
    
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
    
    NSLog(@"载入cell时个数%d",[personList count]);
    return [personList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"detailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Person *person = personList[indexPath.row];
    cell.textLabel.text = person.pId;
    cell.detailTextLabel.text = person.pName;
    NSLog(@"载入cell时明智%@",person.pName);
    
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
        [[SQLiteManager defaultManager]removeItem:[personList objectAtIndex:indexPath.row]];
        [personList removeObjectAtIndex:indexPath.row];
        
        
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UpdateViewController *updateVC = nil;
    updateVC = segue.destinationViewController;
    updateVC.person = sender;
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
    
    [self performSegueWithIdentifier:@"toUpdateItem" sender:[personList objectAtIndex:indexPath.row]];
}
#pragma mark - public methods
- (IBAction)didClickAdd:(UIBarButtonItem *)sender {
    Person *person = [[Person alloc]init];
    person.pId = [NSString stringWithFormat:@"%d",[personList count]+1];
    person.pName = @"shahaha";
    person.pAge = @"46";
    [personList addObject:person];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[personList count] - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [[SQLiteManager defaultManager]insertItem:person];
    [person release];
}
@end
