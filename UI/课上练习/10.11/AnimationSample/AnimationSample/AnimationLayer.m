//
//  AnimationLayer.m
//  AnimationSample
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "AnimationLayer.h"

@implementation AnimationLayer
{
    CGPoint point[4];
}
-(void)reset
{
    CGRect bounds = self.bounds;
    
    CGFloat xInterval = CGRectGetWidth(bounds) / 3;
    
    CGFloat x[4] = {0.0f};
    CGFloat y[4] = {0.0f};
    
    x[0] = xInterval * 0;
    x[1] = xInterval * 1;
    x[2] = xInterval * 2;
    x[3] = xInterval * 3;
    
    y[0] = arc4random() % (NSInteger)CGRectGetHeight(bounds);
    y[1] = arc4random() % (NSInteger)CGRectGetHeight(bounds);
    y[2] = arc4random() % (NSInteger)CGRectGetHeight(bounds);
    y[3] = arc4random() % (NSInteger)CGRectGetHeight(bounds);
    
    point[0] = CGPointMake(x[0], y[0]);
    point[1] = CGPointMake(x[1], y[1]);
    point[2] = CGPointMake(x[2], y[2]);
    point[3] = CGPointMake(x[3], y[3]);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint startPoint = CGPointMake(CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
//    CGPathAddLineToPoint(path, NULL, point[0].x, point[0].y);
//    CGPathAddLineToPoint(path, NULL, point[1].x, point[1].y);
    CGPathAddQuadCurveToPoint(path, NULL, point[0].x, point[0].y, point[1].x, point[1].y);
//    CGPathAddQuadCurveToPoint(path, NULL, point[1].x, point[1].y, point[2].x, point[2].y);
    CGPathAddLineToPoint(path, NULL, point[2].x, point[2].y);
    CGPathAddQuadCurveToPoint(path, NULL, point[3].x, point[3].y, endPoint.x, endPoint.y);
//    CGPathAddLineToPoint(path, NULL, point[3].x, point[3].y);
//    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    CGPathAddLineToPoint(path, NULL, startPoint.x, startPoint.y);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.fromValue = (id)self.path;
    basicAnimation.toValue = (id)path;
    basicAnimation.duration = 0.24f;
    [self addAnimation:basicAnimation forKey:nil];
    self.path = path;
    CGPathRelease(path);
    
}
@end
