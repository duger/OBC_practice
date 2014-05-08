//
//  CustomView.m
//  TuYaSample
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

//内敛函数
static inline CGPoint midPoint(CGPoint point1,CGPoint point2){
    return CGPointMake((point1.x + point2.x) / 2.0f, (point1.y + point2.y) / 2.0f);
}




@implementation CustomView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.lineWidth = 3.0f;
        self.lineArray = [[[NSMutableArray alloc]init] autorelease];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //获取当前视图的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将中间变量图片画到上下文上
    [self.tempImage drawAtPoint:CGPointZero];
    //判断三点无效时，结束绘制
    if (CGPointEqualToPoint(self.preFirstPoint, CGPointZero) &&
        CGPointEqualToPoint(self.firstPoint, CGPointZero)&&
        CGPointEqualToPoint(self.presentPoint, CGPointZero)) {
        return;
    }
    
    //否则绘制
    CGPoint midPoint1 = midPoint(self.preFirstPoint, self.firstPoint);
    CGPoint midPoint2 = midPoint(self.firstPoint, self.presentPoint);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, midPoint1.x   , midPoint1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, midPoint2.x, midPoint2.y);
    
    CGContextAddPath(context, path);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);    CGContextStrokePath(context);
    CGPathRelease(path);
  
 
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.lineArray addObject:[self customImage]];
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = [touch previousLocationInView:self];
    self.firstPoint = [touch previousLocationInView:self];
    self.presentPoint= [touch locationInView:self];
    
    //调用move方法
    [self touchesMoved:touches withEvent:event];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = self.firstPoint;
    self.firstPoint = [touch previousLocationInView:self];
    self.presentPoint = [touch locationInView:self];
    
    CGPoint midPoint1 = midPoint(self.preFirstPoint, self.firstPoint);
    CGPoint midPoint2 = midPoint(self.firstPoint, self.presentPoint);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, midPoint2.x, midPoint2.y);
    
    
    CGRect rect = CGPathGetPathBoundingBox(path);
    rect.origin.x -= 10.0f;
    rect.origin.y -= 10.0f;
    rect.size.width += 15.0f;
    rect.size.height += 15.0f;
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setNeedsDisplayInRect:rect];
    CGPathRelease(path);
    //runLoop循环，是操作执行完成 同时进行的一个小保姆
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
}

-(UIImage *)customImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self.tempImage;
    
}

-(BOOL)reDo
{
    if ([self.lineArray count] == 0) {
        return  YES;
    }
    UIImage *image = [self.lineArray lastObject];
    self.tempImage = image;
    self.preFirstPoint = CGPointZero;
    self.firstPoint = CGPointZero;
    self.presentPoint = CGPointZero;
    
    
    
    [self setNeedsDisplay];
//    [self.lineArray removeLastObject];
    [self.lineArray removeObject:image];
    
    return YES;
}


@end
