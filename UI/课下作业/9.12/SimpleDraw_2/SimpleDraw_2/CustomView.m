//
//  CustomView.m
//  SimpleDraw_2
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
@synthesize startPoint = _startPoint,endPoint = _endPoint;

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, self.startPoint.x, self.startPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, 160,  190, self.endPoint.x, self.endPoint.y);
    
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 5.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取用户点触事件的对象
    UITouch *touch = [touches anyObject];
    //获取触摸点位置
    CGPoint location = [touch locationInView:self];
    //设置两个点
    if (CGPointEqualToPoint(self.startPoint, CGPointZero)) {
        self.startPoint = location;
        return;
    }
    if (CGPointEqualToPoint(self.endPoint, CGPointZero)) {
        self.endPoint = location;
        //通知实体对象开始画图
        [self setNeedsDisplay];
    }
    
    self.startPoint = self.endPoint;
    self.endPoint = location;
    
    [self setNeedsDisplay];
    
    
}

@end
