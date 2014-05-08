//
//  XMLViewController.m
//  XMLandJsonPractise
//
//  Created by Duger on 13-10-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "XMLViewController.h"
#import "Citys.h"
#import "GDataXMLNode.h"


#define wCityName @"name"
#define wLongitude @"longitude_e6"
#define wlatitude @"latitude_e6"
#define wCityURL @"http://www.google.com/ig/cities?hl=en&country=cn&output=xml"

@interface XMLViewController ()

@end

@implementation XMLViewController
{
    NSMutableData *mutableData;
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
    self.citys = [[NSMutableArray alloc]init];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
//    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 50, 30);
    button.center = CGPointMake(160, 400);
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//    [button release];
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
    return [self.citys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"xmlCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
            Citys *city = self.citys[indexPath.row];
        cell.textLabel.text = city.cityName;
        NSString *locations = @"东经：";
        [locations stringByAppendingFormat:@"%@",city.klongitude];
        [locations stringByAppendingFormat:@"北纬: %@",city.klatitude];
        
        cell.detailTextLabel.text = locations;
    
    
    
    return cell;
}

#pragma mark - Table view delegate



#pragma mark - URLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //在接受服务器应答的时候，如果发送网络请求使用的是http协议，则HSURLResponse这个数据类型的返回参数，一定是她的一个子类的实例对象，这个子类是NSHTTPPURLResponse
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //网络请求有很多种协议，不止http，列如ftp等等
    //http协议请求服务器，获得的服务器应答是固定格式的，而且是很常见的，可以通过应答的某些header字段获取想要的值，如文件大小
    //对应的key,同样是response的一个headerField
    //虽然request和response的headerField中同样包含，列如Content-Length 和Content-Type等相同的字符串的字段，但是代表的含义是完全不同的。
    
    NSLog(@"字典里有啥呢%@",[[httpResponse allHeaderFields]description]);
    mutableData = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mutableData appendData:data];
    NSLog(@"数据数据Data %@",mutableData);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    NSMutableString *content = [[NSMutableString alloc]initWithData:mutableData encoding:NSUTF8StringEncoding];
//    NSLog(@"\"");
////    [content delete:@"\""];
////    [content stringByReplacingOccurrencesOfString:@"“" withString:@""];
//    NSArray *contentArray = [content componentsSeparatedByString:@"\""];
//    NSLog(@"%@",contentArray);
    GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithData:mutableData options:0 error:nil];
    NSLog(@"临时111%@",doc);
    GDataXMLElement *root = [doc rootElement];
    NSLog(@"%@", doc.rootElement);
    
    NSArray *tempcity = [[NSArray alloc]init];
    tempcity = [root elementsForName:@"cities"];
    NSLog(@"临时城市%@",[tempcity description]);
    NSArray *tempcities = [[tempcity objectAtIndex:0]elementsForName:@"city"];
//    NSLog(@"临时城市%@",[tempcities elementsForName:@"city"]);
    for (GDataXMLElement *city in tempcities) {
        NSString *cityName = [[[[city elementsForName:wCityName]objectAtIndex:0]attributeForName:@"data"]stringValue];
        NSLog(@"++++++++%@",cityName);
        NSString *longitude = [[[[city elementsForName:wLongitude]objectAtIndex:0]attributeForName:@"data"]stringValue];
        NSString *latitude = [[[[city elementsForName:wlatitude]objectAtIndex:0]attributeForName:@"data"]stringValue];
        Citys *city = [[Citys alloc]init];
        city.cityName = cityName;
        city.klatitude = latitude;
        city.klongitude = longitude;
        [self.citys addObject:city];
        NSLog(@"城市城市%@",city.cityName);
        [city release];
    }
    
    [self.tableView reloadData];
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

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

- (IBAction)didClickButton:(UIBarButtonItem *)sender {
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithString:wCityURL] delegate:self];
}
@end
