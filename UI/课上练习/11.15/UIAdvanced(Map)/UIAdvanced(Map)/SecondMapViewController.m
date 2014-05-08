//
//  SecondMapViewController.m
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "SecondMapViewController.h"
#import "CustomAnnotation.h"

@interface SecondMapViewController ()

@end

@implementation SecondMapViewController

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
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 100.0f;
        [self.locationManager startUpdatingLocation];
        self.locationManager.delegate = self;
    }
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0f;
    [self.mapView addGestureRecognizer:longPress];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint currentPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D coord = [self.mapView convertPoint:currentPoint toCoordinateFromView:self.mapView];
        
        NSArray *annotaionArray = [self.mapView annotations];
        for (id annotation in annotaionArray) {
            if ([annotation isKindOfClass:[CustomAnnotation class]]) {
                CustomAnnotation *customAnn = (CustomAnnotation *)annotation;
                [self.mapView removeAnnotation:customAnn];
                
                [customAnn setCoordinate:coord];
                [self.mapView addAnnotation:customAnn];
            }else{
                MKPinAnnotationView<MKAnnotation> *currentAnn = (MKPinAnnotationView<MKAnnotation> *)annotation;
                if ([currentAnn.title isEqualToString:@"Current Location"]) {
                    continue;
                }
                CustomAnnotation *newAnnotation = [[CustomAnnotation alloc]initWithTitle:Nil subtitle:Nil latitude:coord.latitude longitude:coord.longitude];
                [self.mapView addAnnotation:newAnnotation];
            }
        }
        
        
    }
}

#pragma mark - CoreLocation delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    CLLocationCoordinate2D coor = newLocation.coordinate;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(coor, span);
    [self.mapView setRegion:region animated:YES];
    
    //取得坐标位置
    
    CLLocation *location = [[CLLocation alloc]initWithLatitude:coor.latitude longitude:coor.longitude];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks) {
            NSString *title = [place.addressDictionary objectForKey:@"Name"];
            NSString *subTitle = [place.addressDictionary objectForKey:@"SubLocality"];
            for (CustomAnnotation *object in [self.mapView annotations]) {
                object.title = title;
                object.subtitle = subTitle;
            }
            
        }
    }];
    
    
    
    [self.locationManager stopUpdatingLocation];
    
}

#pragma mark MKMapView Delegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation.title isEqualToString:@"Current Location"]) {
        return nil;
    }
    
    static NSString *annotationID = @"anno_id";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationID];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationID];
    }
    annotationView.pinColor = MKPinAnnotationColorPurple;
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    annotationView.draggable = YES;
    
    return annotationView;
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
{
    NSLog(@"%s",__FUNCTION__);
}


@end
