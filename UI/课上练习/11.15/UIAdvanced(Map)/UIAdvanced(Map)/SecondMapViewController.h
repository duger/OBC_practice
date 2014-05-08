//
//  SecondMapViewController.h
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface SecondMapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,strong) CLLocationManager *locationManager;
@property(nonatomic,strong) MKMapView *mapView;

@property(nonatomic, strong) NSMutableData *receivedData;

@end
