//
//  CustomAnnotation.h
//  UIAdvanced(Map)
//
//  Created by Duger on 13-11-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject<MKAnnotation>
//大头针中心经纬度
@property (nonatomic,assign, readonly) CLLocationCoordinate2D coordinate;
//大头针主标题
@property(nonatomic, copy) NSString *title;
//大头针子标题
@property(nonatomic ,copy) NSString *subtitle;
@property(nonatomic ,assign )CLLocationDegrees latitude;//维度
@property(nonatomic ,assign )CLLocationDegrees longitude;//经度

//自定义视图初始化方法
-(id)initWithTitle:(NSString *)title_
            subtitle:(NSString *)subtitle_
            latitude:(CLLocationDegrees)latitude_
            longitude:(CLLocationDegrees)longitude_;

//coordeinate设置器
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@end
