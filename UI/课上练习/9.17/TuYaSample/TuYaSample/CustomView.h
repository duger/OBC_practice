//
//  CustomView.h
//  TuYaSample
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

//自定义线段的宽度
@property(nonatomic,assign) CGFloat lineWidth;
//画图时的中间图
@property(nonatomic,retain) UIImage *tempImage;

@property(nonatomic,assign) CGPoint preFirstPoint;

@property(nonatomic,assign) CGPoint firstPoint;

@property(nonatomic,assign) CGPoint presentPoint;

//保存每条线的数组
@property(nonatomic,retain) NSMutableArray *lineArray;

//撤销一条线
-(BOOL)reDo;

-(UIImage *)customImage;
@end
