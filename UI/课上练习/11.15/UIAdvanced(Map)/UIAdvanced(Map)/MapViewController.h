//
//  MapViewController.h
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,NSURLConnectionDataDelegate>

//位置服务管理对象
@property(nonatomic, strong) CLLocationManager *locationManger;
//地图
@property(nonatomic, strong) MKMapView *mapView;

@property(nonatomic ,strong) NSMutableData *receivedData;
@end
