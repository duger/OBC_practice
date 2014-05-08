//
//  FirstViewController.h
//  UploadSample
//
//  Created by Lewis on 13-10-17.
//  Copyright (c) 2013年 www.lanou3g.com  北京蓝鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<NSURLConnectionDataDelegate,UIAlertViewDelegate>
- (IBAction)didClickUpload:(id)sender;
@property (retain, nonatomic) IBOutlet UIProgressView *progressView;
@property (retain, nonatomic) IBOutlet UILabel *progressLabel;

@end
