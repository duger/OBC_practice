//
//  MapViewController.m
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位正常");
        self.locationManger = [[CLLocationManager alloc]init];
        //期待的精度
        self.locationManger.desiredAccuracy = kCLLocationAccuracyBest;
        //距离过滤 ： 超出我们设定的方圆100米会重新校正
        self.locationManger.distanceFilter = 100.0f;
        //发送start消息 启动定位
        [self.locationManger startUpdatingLocation];
        
        self.locationManger.delegate = self;

        
    }else{
        NSLog(@"定位异常");
    }
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.mapType = MKMapTypeStandard;//地图类型
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;//显示用户位置
    [self.view addSubview:self.mapView];
    
    
    
    //获取当前地图的中心经纬度
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(39.912, 116.233);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    //让地图缩放
    [self.mapView setRegion:region animated:YES];
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0f;
    [self.mapView addGestureRecognizer:longPress];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//长按手势响应
-(void)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint currentPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D coord = [self.mapView convertPoint:currentPoint toCoordinateFromView:self.mapView];
//        CustomAnnotation *newAnnotation = [[CustomAnnotation alloc]initWithTitle:Nil subtitle:nil latitude:coord.latitude longitude:coord.longitude];
        //判断当前地图上有没有大头针，若存在，则重用
        NSArray *annotationArray = [self.mapView annotations];
        for (id annotation in annotationArray) {
            if ([annotation isKindOfClass:[CustomAnnotation class]]) {
                CustomAnnotation *custonAnn = (CustomAnnotation *)annotation;
                [self.mapView removeAnnotation:custonAnn];
                
                [custonAnn setCoordinate:coord];
                [self.mapView addAnnotation:custonAnn];
            }else{
                //防止当前用户位置（小蓝点儿）被修改
                CustomAnnotation *currentAnn = (CustomAnnotation *)annotation;
                if ([currentAnn.title isEqualToString:@"Current Location"]) {
                    continue;
                }
                CustomAnnotation *newAnnotation = [[CustomAnnotation alloc]initWithTitle:Nil subtitle:nil latitude:coord.latitude longitude:coord.longitude];
                [self.mapView addAnnotation:newAnnotation];
            }
        }
        
        
        NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true",coord.latitude,coord.longitude];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        [NSURLConnection connectionWithRequest:request delegate:self];
        
//        [NSURLConnection sendAsynchronousRequest:request queue:nil completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"dic = %@",dic);
//        }];

        
        
    }
    
}

#pragma mark CLLocationManager delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",[locations lastObject]);
    CLLocation *newLocation = [locations lastObject];
    
    CustomAnnotation *centerAnnotation = [[CustomAnnotation alloc]initWithTitle:@"狗洞家" subtitle:@"狗窝" latitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    [self.mapView addAnnotation:centerAnnotation];
}

#pragma mark MKMapView delegate
//类比tableView ，同样遵循重用机制
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //防止当前用户位置（小蓝点儿）被修改
    if ([annotation.title isEqualToString:@"Current Location"]) {
        return nil;
    }
    //注解视图的重用标示符
    static NSString *annotationID = @"anno_id";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationID];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationID];
    }
    //大头针颜色
    annotationView.pinColor = MKPinAnnotationColorPurple;
    //大头针下落动画
    annotationView.animatesDrop = YES;
    //显示弹出视图
    annotationView.canShowCallout = YES;
    //可拖拽
    annotationView.draggable = YES;
    
    return annotationView;
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
{
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark URLConnection Delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (!self.receivedData) {
        self.receivedData = [[NSMutableData alloc]init];
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:self.receivedData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",[[[resultDic objectForKey:@"results"] objectAtIndex:0] objectForKey:@"formatted_address"]);
    
    NSLog(@"%@",resultDic);
    
    NSString *subTitle = [[[resultDic objectForKey:@"results"] objectAtIndex:0] objectForKey:@"formatted_address"];
    NSString *titleString = [[[[[resultDic objectForKey:@"results"] objectAtIndex:0] objectForKey:@"address_components"]objectAtIndex:1]objectForKey:@"long_name"];
    NSLog(@"%@",titleString);
    
    for (CustomAnnotation *object in [self.mapView annotations]) {
        object.title = titleString;
        object.subtitle = subTitle;
    }
    
    
    [self.receivedData setData:nil];
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"网络错误啦%@",error);
}

@end
