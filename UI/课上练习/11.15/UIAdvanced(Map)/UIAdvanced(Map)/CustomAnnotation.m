//
//  CustomAnnotation.m
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

-(id)initWithTitle:(NSString *)title_
          subtitle:(NSString *)subtitle_
          latitude:(CLLocationDegrees)latitude_
         longitude:(CLLocationDegrees)longitude_
{
    if (self = [super init]) {
        self.title = title_;
        self.subtitle = subtitle_;
        self.latitude = latitude_;
        self.longitude = longitude_;
    }
    return self;
}


#pragma mark - coordinate getter & setter

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    self.latitude = newCoordinate.latitude;
    self.longitude = newCoordinate.longitude;
}

-(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    return coor;
}

@end
