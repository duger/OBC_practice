//
//  PaintView.m
//  PaintGame
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "PaintView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PaintView
{
    UIImage *images;
}


@synthesize path,imageList,lineSize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.lineSize = 3.0f; 
    }
    return self;
}




- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //获取当前视图的绘图的图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    [self.myImage drawAtPoint:CGPointZero];
    
    if (CGPointEqualToPoint(self.preFirstPoint, CGPointZero)) {
        return;
    }

    
    
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, lineSize);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
     
    CGContextStrokePath(context);
//    CGContextFillPath(context);
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    self.preFirstPoint = [touch previousLocationInView:self];
    self.firstPoint = [touch locationInView:self];
    self.SecondPoint = [touch locationInView:self];
    
    [self touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    
    self.preFirstPoint = self.firstPoint;
    self.firstPoint = [touch previousLocationInView:self];
    self.SecondPoint = [touch locationInView:self];
    
    CGPoint mid1 = CGPointMake((self.preFirstPoint.x + self.firstPoint.x) / 2, (self.preFirstPoint.y + self.firstPoint.y)/ 2) ;
    CGPoint mid2 = CGPointMake((self.firstPoint.x + self.SecondPoint.x) / 2, (self.firstPoint.y + self.SecondPoint.y)/ 2 );
    
     path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, mid1.x, mid1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.firstPoint.x, self.firstPoint.y, mid2.x, mid2.y);
    
    //获取矩形
    CGRect rect = CGPathGetBoundingBox(path);
    rect.origin.x -= 10.0f;
    rect.origin.y -= 10.0f;
    rect.size.width += 20.0f;
    rect.size.height += 20.0f;
    
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setNeedsDisplayInRect:rect];

}

-(void)reDo
{

    
    
    [self.imageArray removeLastObject];
    self.myImage = [self.imageArray lastObject];
    CGPathMoveToPoint(path, NULL, CGPointZero.x , CGPointZero.y);
    CGPathAddQuadCurveToPoint(path, NULL, CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y);
    self.preFirstPoint = CGPointZero;
    
    [self setNeedsDisplay];
    
    

}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
  
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    images = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    
//    [lineArray addObject:images];
//    NSLog(@"lineArray%d",lineArray.count);
    
    [self.imageArray addObject:images];
//    NSLog(@"imageArray %d",self.imageArray.count);

    
}

- (void)dealloc
{
    self.myImage = nil;
    self.imageList = nil;
    self.imageArray = nil;
    [super dealloc];
}

@end
