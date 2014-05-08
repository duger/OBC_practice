//
//  WFmyView.h
//  DrawGameBAKEE
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFmyView : UIView


@property(assign,nonatomic)CGPoint preFirstPoint;
@property(assign,nonatomic)CGPoint firstPoint;
@property(assign,nonatomic)CGPoint lastPoint;
@property(retain,nonatomic)UIImage *myImage;
@property(assign,nonatomic)CGFloat lineWidth;

@property(retain,nonatomic)NSMutableArray *imageList;
-(UIImage *)getMyImage;

-(void)reDo;

@end
