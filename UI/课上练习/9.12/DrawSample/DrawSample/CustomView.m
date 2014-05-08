//
//  CustomView.m
//  DrawSample
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomView
@synthesize firstPoint = _firstPoint;
@synthesize secondPoint = _secondPoint;

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
    
    //获取当前视图绘图的画布（图形上下文）
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.currentImage drawAtPoint:CGPointZero];
    
/*
    CGContextClearRect(context, rect);
    CGPathRef rectPath = CGPathCreateWithRect(rect, NULL);
    CGContextAddPath(context, rectPath);
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextFillPath(context);
  */  
 /*   //起点
    CGPoint startPoint = CGPointMake(100, 100);
    //终点
    CGPoint endPoint = CGPointMake(200, 100);
  */
    
    
 /*   //创建一个可变长度的线条（路径）
    CGMutablePathRef path = CGPathCreateMutable();
    //移动路径到起点
    CGPathMoveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y);
    //添加一条直线
    CGPathAddLineToPoint(path, NULL, self.secondPoint.x, self.secondPoint.y);
 */
    CGPoint mid1 = CGPointMake((self.preFirstPoint.x + self.firstPoint.x)/2, (self.preFirstPoint.y + self.firstPoint.y) / 2 );
    CGPoint mid2 = CGPointMake((self.firstPoint.x + self.secondPoint.x ) / 2, (self.firstPoint.y + self.secondPoint.y) / 2);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, mid1.x, mid1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, mid2.x, mid2.y);
    
    
    //将对应的路径添加到已经获取的画布上
    CGContextAddPath(context, path);
    
    //定义图形上下文当前批次当前绘制时使用的宽度
    CGContextSetLineWidth(context, 5.0f);
    //定义推行上下文当前批次绘制时使用的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    
    //设置图形上下文当前批次绘制时线的形状
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //画
    CGContextStrokePath(context);
//    CGContextFillPath(context);
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取用户触事件的对象
    UITouch *touch = [touches anyObject];
  /*  //获取触摸点的位置
    CGPoint location = [touch locationInView:self];
    //设置两个点
    if (CGPointEqualToPoint(self.firstPoint, CGPointZero)) {
        self.firstPoint = location;
        return;
    }
    if (CGPointEqualToPoint(self.secondPoint, CGPointZero)) {
        self.secondPoint = location;
        //通知实体对象开始画图
        [self setNeedsDisplay];
    }
 */   
    self.preFirstPoint = [touch previousLocationInView:self];
    self.firstPoint = [touch previousLocationInView:self];
    self.secondPoint = [touch locationInView:self];
    	
    //通知视图对象开始画画
//    [self setNeedsDisplay];
   
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
    
    CGPoint mid1 = CGPointMake((self.preFirstPoint.x + self.firstPoint.x)/2, (self.preFirstPoint.y + self.firstPoint.y) / 2 );
    CGPoint mid2 = CGPointMake((self.firstPoint.x + self.secondPoint.x ) / 2, (self.firstPoint.y + self.secondPoint.y) / 2);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, mid1.x, mid1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, mid2.x, mid2.y);
    
    //获取能够刚刚容纳这个路径的矩形
    CGRect rect = CGPathGetBoundingBox(path);
    rect.origin.x -= 10.0f;
    rect.origin.y -= 10.0f;
    rect.size.width += 20.0f;
    rect.size.height += 20.0f;
    
    //从视图得到图片
    //开始
    UIGraphicsBeginImageContext(self.bounds.size);
    //将图层渲染到当前图形上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    //从当前图形上下文获取图片
    self.currentImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束
    UIGraphicsEndImageContext();
    
    [self setNeedsDisplayInRect:rect];
    
//    [self setNeedsDisplay];
}


@end
