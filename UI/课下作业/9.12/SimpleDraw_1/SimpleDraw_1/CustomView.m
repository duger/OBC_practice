//
//  CustomView.m
//  SimpleDraw_1
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //获取当前视图 绘制画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //建立两个点
    CGPoint startPoint = CGPointMake(100,100);
    CGPoint endPoint = CGPointMake(150, 300);
    
    //建立一条可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    //移动路径到起点
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    //添加一条直线到终点
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    //将路径添加到画布上
    CGContextAddPath(context, path);
    //定义图形上下文当前批次所定义的图形宽度
    CGContextSetLineWidth(context, 8.0f);
    //定义画布上当前批次所定义的图形绘制的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    //设置画布上当前批次所定义图形的形状
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //画上去
    CGContextStrokePath(context);
    
    
    
    
}


@end
