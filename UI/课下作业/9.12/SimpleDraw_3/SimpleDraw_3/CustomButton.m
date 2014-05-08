//
//  CustomButton.m
//  SimpleDraw_3
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomButton
@synthesize firstPoint = _firstPoint,secondPoint = _secondPoint,preFirstPoint = _preFirstPoint;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.currentImage drawAtPoint:CGPointZero];
//    UIImageWriteToSavedPhotosAlbum(self.currentImage, nil, nil, nil);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, self.preFirstPoint.x, self.preFirstPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x , self.firstPoint.y , self.secondPoint.x, self.secondPoint.y);
    
    CGContextAddPath(context, path);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 5.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    
    CGContextStrokePath(context);
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = [touch previousLocationInView:self];
    self.firstPoint = [touch previousLocationInView:self];
    self.secondPoint = [touch locationInView:self];
    
    [self touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取用户触摸事件
    UITouch *touch = [touches anyObject];
    //0
    self.preFirstPoint = self.firstPoint;
    //1
    CGPoint preLocation = [touch previousLocationInView:self];
    //2
    CGPoint curLocation = [touch locationInView:self];
    
    self.firstPoint = preLocation;
    self.secondPoint = curLocation;
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, self.preFirstPoint.x, self.preFirstPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x , self.firstPoint.y , self.secondPoint.x, self.secondPoint.y);
    
    //获取能够容纳这个路径的矩形
    CGRect rect = CGPathGetBoundingBox(path);
    rect.origin.x -= 5.0f;
    rect.origin.y -= 5.0f;
    rect.size.width += 15.0f;
    rect.size.height += 15.0f;
    
    //从视图得到图片
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setNeedsDisplayInRect:rect];
}


@end
