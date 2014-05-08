//
//  WFsView.m
//  DrawWark
//
//  Created by Duger on 13-9-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFsView.h"
#import <QuartzCore/QuartzCore.h>


static inline CGPoint midPoint(CGPoint value1,CGPoint value2){
    return CGPointMake((value1.x + value2.x) / 2.0f, (value1.y + value2.y) / 2.0f);
}

@implementation WFsView
//@synthesize path = _path;
{
    CGMutablePathRef totalPath;
}

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
        self.lingwidth = 3.0f;
        self.lineList = [[NSMutableArray alloc]init];
        //初始化！！
        self.lineArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, NULL);
        
        totalPath = CGPathCreateMutable();
        
        /*
         CFArrayAppendValue(self.lineArray, self.path);
         
         self.path = (CGMutablePathRef)CFArrayGetValueAtIndex(self.lineArray, 0);
         
         CFArrayRemoveValueAtIndex(self.lineArray, 0);
         */
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (CGPointEqualToPoint(self.lastPoint, CGPointZero)) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //    [self.myImage drawAtPoint:CGPointZero];
    
    //    CGPoint midPoint1 = midPoint(self.prePoint, self.thePoint);
    //    CGPoint midPoint2 = midPoint(self.thePoint, self.lastPoint);
    //
    //
    //    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    //    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGContextAddPath(context, totalPath);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lingwidth);
    
    CGContextStrokePath(context);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    @try
    {
        self.path = CGPathCreateMutable();
        CFArrayAppendValue(self.lineArray, self.path);
    }
    @catch (NSException *exception) {
        ;
    }
    @finally {
        ;
    }
    UITouch *touch = [touches anyObject];
    self.prePoint = self.thePoint;
    self.thePoint = [touch previousLocationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    [self touchesMoved:touches withEvent:event];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.prePoint = self.thePoint;
    self.thePoint = [touch previousLocationInView:self];
    self.lastPoint = [touch locationInView:self];
    
    CGPoint midPoint1 = midPoint(self.prePoint, self.thePoint);
    CGPoint midPoint2 = midPoint(self.thePoint, self.lastPoint);
    
    
    //    CGPathMoveToPoint(totalPath, NULL, midPoint1.x, midPoint1.y);
    //    CGPathAddQuadCurveToPoint(totalPath, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    
    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGPathAddPath(totalPath, NULL, self.path);
    
    //    CGRect rect = CGPathGetBoundingBox(self.path);
    //    rect.origin.x -= 1.5f * self.lingwidth;
    //    rect.origin.y -= 1.5f * self.lingwidth;
    //    rect.size.width += 2.0f * self.lingwidth;
    //    rect.size.height += 2.0f * self.lingwidth;
    //
    //    UIGraphicsBeginImageContext(self.bounds.size);
    //    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    //    self.myImage  = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    
    [self setNeedsDisplay];
    //    CGPathRelease(self.path);
    //    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
    
}

-(void)getPath
{
    CGPoint midPoint1 = midPoint(self.prePoint, self.thePoint);
    CGPoint midPoint2 = midPoint(self.thePoint, self.lastPoint);
    
    
    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGPathAddPath(totalPath, NULL, self.path);
}

-(void)roDo
{
    //    if ([self.lineList count] == 0) {
    //        return;
    //    }
    CFIndex count = CFArrayGetCount(self.lineArray);
    if (count == 0) {
        return;
    }
    NSLog(@"%ld",count);
    CGPathRelease(totalPath),totalPath = NULL;
    totalPath = CGPathCreateMutable();
    
    for (int i = 0; i < count - 1; i++) {
        CGPathAddPath(totalPath, NULL, (CGMutablePathRef)CFArrayGetValueAtIndex(self.lineArray, i));
    }
    //    self.path = (CGMutablePathRef)CFArrayGetValueAtIndex(self.lineArray, count -1 );
    //    CFArrayGetLastIndexOfValue(self.lineArray, CFRangeMake(0, count - 1), self.path);
    CFArrayRemoveValueAtIndex(self.lineArray, count - 1);
    
    
    [self setNeedsDisplay];
    
    
}



-(UIImage *)getMyImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self.myImage;
}


@end
