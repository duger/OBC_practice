//
//  RootViewController.m
//  SDWebImageSample
//
//  Created by Duger on 13-10-31.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "RootViewController.h"
#import "UIImageView+WebCache.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    NSMutableArray *_imageURLArray;
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
    _imageURLArray = [[NSMutableArray alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    //构造一些数据
    NSString *pic1 = @"http://124.205.147.26/student/class_10/team_seven/resource/images/1383124725.png";
    NSString *sound2 = @"http://124.205.147.26/student/class_10/team_seven/resource/sounds/1383013333.mp3";
    NSString *pic3 = @"http://124.205.147.26/student/class_10/team_seven/resource/images/1383013882.png";
    NSString *sound4 = @"http://124.205.147.26/student/class_10/team_seven/resource/sounds/1383124727.mp3";
    [_imageURLArray addObject:[NSURL URLWithString:pic1]];
    [_imageURLArray addObject:[NSURL URLWithString:sound2]];
    [_imageURLArray addObject:[NSURL URLWithString:pic3]];
    [_imageURLArray addObject:[NSURL URLWithString:sound4]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _imageURLArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:_imageURLArray[indexPath.row] placeholderImage:[UIImage imageNamed:@"LOG-IN.png"] ];
    
    return cell;
}


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

@end
