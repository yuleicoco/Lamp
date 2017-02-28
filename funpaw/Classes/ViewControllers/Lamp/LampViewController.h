//
//  LampViewController.h
//  funpaw
//
//  Created by czx on 2017/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "BaseViewController.h"

@interface LampViewController : BaseViewController

@property(nonatomic,strong)NSTimer * moveTimer;
@property(nonatomic,strong)UIButton * openVideoBtn;
@property(nonatomic,strong)UIImageView * bgImage;
@property(nonatomic,strong)UIButton * addBtn;
@property(nonatomic,strong)UIImageView * SbgImage;
@property(nonatomic,strong)UIButton * IkonwBtn;
@property(nonatomic,strong)UIImageView * Guideview;
@property(nonatomic,strong)NSString * strState;
@property(nonatomic,strong)NSString * DeviceNum;

@end
