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
    
    CGContextAddPath(context, totalPath);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lingwidth);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    
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
    
    
    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGPathAddPath(totalPath, NULL, self.path);


    
    [self setNeedsDisplay];
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
    
}

-(void)roDo
{
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
    CFArrayRemoveValueAtIndex(self.lineArray, count - 1);
    [self setNeedsDisplay];
    
    
//    totalPath = (CGMutablePathRef)CFArrayGetValueAtIndex(self.lineArray, count -1 );
//    CFArrayGetLastIndexOfValue(self.lineArray, CFRangeMake(0, count - 1), self.path);

}



-(UIImage *)getMyImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.myImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return self.myImage;
}



- (void)dealloc
{
    self.myImage = nil;
    
    [super dealloc];
}

/*
-(CGMutablePathRef)getPath
{
    CGPoint midPoint1 = midPoint(self.prePoint, self.thePoint);
    CGPoint midPoint2 = midPoint(self.thePoint, self.lastPoint);
    
    self.path = CGPathCreateMutable();
    CGPathMoveToPoint(self.path, NULL, midPoint1.x, midPoint1.y);
    CGPathAddQuadCurveToPoint(self.path, NULL, self.thePoint.x, self.thePoint.y, midPoint2.x, midPoint2.y);
    CGPathAddPath(totalPath, NULL, self.path);
    
    return totalPath;
}
*/

@end
