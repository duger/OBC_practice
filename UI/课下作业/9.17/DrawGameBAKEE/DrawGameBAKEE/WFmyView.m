//
//  WFmyView.m
//  DrawGameBAKEE
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFmyView.h"
#import <QuartzCore/QuartzCore.h>


static inline CGPoint midPoint(CGPoint point1,CGPoint point2){
    return CGPointMake((point1.x + point2.x) / 2.0f, (point1.y + point2.y) / 2.0f);
}

@implementation WFmyView

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
        self.imageList = [[[NSMutableArray alloc]init] autorelease];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.myImage drawAtPoint:CGPointZero];
    
    if (CGPointEqualToPoint(self.lastPoint, CGPointZero)) {
        return;
    }
    
    //绘制
    CGPoint midPoint_1 = midPoint(self.preFirstPoint, self.firstPoint);
    CGPoint midPoint_2 = midPoint(self.firstPoint, self.lastPoint);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, midPoint_1.x, midPoint_1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, midPoint_2.x, midPoint_2.y);
    CGContextAddPath(context, path);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    
    CGPathRelease(path);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.imageList addObject:[self getMyImage]];
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = self.firstPoint;
    self.firstPoint = [touch previousLocationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    
    
    [self touchesMoved:touches withEvent:event];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = self.firstPoint;
    self.firstPoint = [touch previousLocationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    CGPoint midPoint_1 = midPoint(self.preFirstPoint,self.firstPoint);
    CGPoint midPoint_2 = midPoint(self.firstPoint, self.lastPoint);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, midPoint_1.x, midPoint_1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, midPoint_2.x,midPoint_2.y);
    
    CGRect rect = CGPathGetBoundingBox(path);
    rect.origin.x -= 1.0f * self.lineWidth;
    rect.origin.y -= 1.0f * self.lineWidth;
    rect.size.width += 2.0f *self.lineWidth;
    rect.size.height += 2.0f * self.lineWidth;
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setNeedsDisplayInRect:rect];
    CGPathRelease(path);
    
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
    
}

-(UIImage *)getMyImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self.myImage;
}

-(void)reDo
{
    if ([self.imageList count] == 0) {
        return;
    }
    self.lastPoint = CGPointZero;
    self.myImage = [self.imageList lastObject];
    
    [self setNeedsDisplay];
    [self.imageList removeLastObject];
    
}

- (void)dealloc
{
    self.myImage = nil;
    self.imageList = nil;
    [super dealloc];
}

@end
