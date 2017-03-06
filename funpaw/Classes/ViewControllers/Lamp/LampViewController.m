//
//  LampViewController.m
//  funpaw
//
//  Created by czx on 2017/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "LampViewController.h"
#import "ShareWork.h"
#import "ShareWork+GetSipIP.h"
#import "InCallViewController.h"
#import "HWWeakTimer.h"
#import "ShareWork+device.h"
#import "WifiViewController.h"
#import "BindingViewController.h"
#import "ShareWork+Incall.h"


@interface LampViewController ()
{
    NSArray * arrBtn;

}

@end

@implementation LampViewController
@synthesize moveTimer;
@synthesize openVideoBtn;
@synthesize bgImage;
@synthesize addBtn;
@synthesize SbgImage;
@synthesize Guideview;
@synthesize IkonwBtn;
@synthesize strState;
@synthesize DeviceNum;
@synthesize modelOt;
@synthesize Isother;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SKY_bLUE_COLOR;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:{
            // 许可对话没有出现，发起授权许可
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    //第一次用户接受
                }else{
                    //用户拒绝
                    return ;
                }
            }];
            break;
        }
        case AVAuthorizationStatusAuthorized:{
            // 已经开启授权，可继续
            break;
        }
        case AVAuthorizationStatusDenied:
        case AVAuthorizationStatusRestricted:
            // 用户明确地拒绝授权，或者相机设备无法访问
            break;
        default:
            break;
    }
    //麦克风
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        if (granted) {
            // 用户同意获取麦克风
            NSLog(@"用户同意获取麦克风");
        } else {
            // 用户不同意获取麦克风
            NSLog(@"用户不同意");
        }
        
    }];
}

// start
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callUpdate:) name:kSephoneCallUpdate object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registrationUpdate:) name:kSephoneRegistrationUpdate object:nil];
   
    
    //去掉导航栏下面的线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 检查设置状态
    moveTimer =[HWWeakTimer scheduledTimerWithTimeInterval:5.0 block:^(id userInfo) {
        [self checkDeviceStats];
    } userInfo:@"Fire" repeats:YES];
    [self checkDeviceStats];
    // 检查是否提示
    [self ChooseGuide];

}
//检查是否引导页
-(void)ChooseGuide
{
    // 这个时候出现引导界面
    if ([[Defaluts objectForKey:@"guide_image"] isEqualToString:@"ok"]) {
        IkonwBtn.hidden = NO;
        Guideview.hidden = NO;
        [Defaluts removeObjectForKey:@"guide_image"];
        [Defaluts synchronize];
    }
    
}


/**
 通话状态处理
 
 @param notif se
 */
- (void)callUpdate:(NSNotification *)notif {
    SephoneCall *call = [[notif.userInfo objectForKey:@"call"] pointerValue];
    SephoneCallState state = [[notif.userInfo objectForKey:@"state"] intValue];
    
    switch (state) {
        case SephoneCallOutgoingInit:{
            // 成功
            InCallViewController *   _incallVC =[[InCallViewController alloc]init];
            [_incallVC setCall:call];
            [self presentViewController:_incallVC animated:YES completion:nil];
            break;
        }
        case SephoneCallStreamsRunning: {
            break;
        }
        case SephoneCallUpdatedByRemote: {
            break;
        }
        default:
            break;
    }
}

/**
 注册消息处理
 
 @param notif se
 */
- (void)registrationUpdate:(NSNotification *)notif {
    SephoneRegistrationState state = [[notif.userInfo objectForKey:@"state"] intValue];
    switch (state) {
        case SephoneRegistrationNone:
            NSLog(@"======开始");
            break;
        case SephoneRegistrationProgress:
            NSLog(@"=====注册进行");
            break;
        case SephoneRegistrationOk:
            NSLog(@"=======成功");
            break;
        case SephoneRegistrationCleared:
            break;
        case SephoneRegistrationFailed:
            break;
            
        default:
            break;
    }
    
}
// end
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSephoneCallUpdate object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kSephoneRegistrationUpdate object:nil];
   // [[NSNotificationCenter  defaultCenter]removeObserver:self name:@"otherNam" object:nil];
 
    [moveTimer invalidate];
    
    //由于去掉了线，要还原导航栏样式
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    
}


- (void)setupData
{
    [super setupData];
    [self setNavTitle:@"设备"];
    // 获取sip地址
    [[ShareWork sharedManager]service:nil complete:^(BaseModel *model) {
        if ([model.retCode isEqualToString:@"0000"]) {
            // SIP注册 www.segosip001.cn
            [SephoneManager addProxyConfig:[AccountManager sharedAccountManager].loginModel.sipno password:[AccountManager sharedAccountManager].loginModel.sippw domain:model.content];
        }
    }];
}
- (void)setupView
{
    [super setupView];
    // 手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletapPressGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    
    
    // 指导界面
    Guideview =[UIImageView new];
    Guideview.image =[UIImage imageNamed:@"egg_guide"];
    Guideview.userInteractionEnabled = YES;
    Guideview.hidden = YES;
    
    [ApplicationDelegate.window addSubview:Guideview];
    [Guideview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ApplicationDelegate.window.mas_centerY);
        make.size.mas_equalTo(ApplicationDelegate.window);
        
    }];
    
    IkonwBtn =[UIButton new];
    [IkonwBtn setImage:[UIImage imageNamed:@"konw"] forState:UIControlStateNormal];
    [IkonwBtn addTarget:self action:@selector(disparrBtn:) forControlEvents:UIControlEventTouchUpInside];
    IkonwBtn.hidden = YES;
    
    
    [Guideview addSubview:IkonwBtn];
    
    [IkonwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ApplicationDelegate.window.mas_centerX);
        make.top.equalTo(@250);
        make.height.equalTo(@39);
        make.width.equalTo(@78);
    }];
    
    // 背景图
    
    bgImage =[UIImageView new];
    [self.view addSubview:bgImage];
    
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // make.width.mas_equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
        make.right.left.equalTo(@0);
        
        
        
    }];
    
    // 添加按钮
    addBtn =[UIButton new];
    [addBtn setImage:[UIImage imageNamed:@"egg_add"] forState:UIControlStateNormal];
    addBtn.hidden = YES;
    [addBtn addTarget:self action:@selector(btn_add:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(90, 60));
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-184);
        
        
        
    }];
    
    
    
    
    
    // 开启按钮
    openVideoBtn =[UIButton new];
    [openVideoBtn setTitle:@"开启" forState:UIControlStateNormal];
    openVideoBtn.layer.cornerRadius =45;
    openVideoBtn.hidden = YES;
    openVideoBtn.layer.borderWidth =1;
    [openVideoBtn addTarget:self action:@selector(OpenVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openVideoBtn];
    [openVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.width.equalTo(@90);
        make.bottom.equalTo(self.view.mas_centerY).offset(140);
        make.centerX.equalTo(self.view.mas_centerX);
        
    }];
    
    // tab
    SbgImage =[UIImageView new];
    SbgImage.image =[UIImage imageNamed:@"down_list"];
    SbgImage.userInteractionEnabled = YES;
    SbgImage.hidden = YES;
    [self.view addSubview:SbgImage];
    
    [SbgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(105, 92));
        make.right.equalTo(self.view).offset(-11);
        make.top.equalTo(self.view).offset(1);
        
    }];
    
    
    UIButton * wifiBtn =[UIButton new];
    UIButton * bdinBtn =[UIButton new];
    // 三个buton
    
    [wifiBtn setTitle:@"设置wifi" forState:UIControlStateNormal];
    [wifiBtn addTarget:self action:@selector(wifiTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [bdinBtn addTarget:self action:@selector(bdinTouch:) forControlEvents:UIControlEventTouchUpInside];
    [bdinBtn setTitle:@"解绑设备" forState:UIControlStateNormal];
    [SbgImage addSubview:wifiBtn];
    [SbgImage addSubview:bdinBtn];
    
    arrBtn =[NSArray array];
    arrBtn =@[wifiBtn,bdinBtn];
    
    [arrBtn mas_distributeViewsAlongAxis:MASAxisTypeVertical
                        withFixedSpacing:15
                             leadSpacing:15
                             tailSpacing:6];
    
    [arrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(90);
       
        make.right.equalTo(SbgImage).offset(-5);
        
    }];
}

// 功能列表
-(void)handletapPressGesture:(UITapGestureRecognizer*)sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        SbgImage.hidden = YES;
    } completion:^(BOOL finished) {
        
    }];
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 [self.view removeGestureRecognizer:sender];
                             }];
}

// 知道按钮
- (void)disparrBtn:(UIButton *)sender
{
    bgImage.hidden = NO;
    IkonwBtn.hidden = YES;
    [sender removeFromSuperview];
    [Guideview removeFromSuperview];
}

// 检查设备状态
- (void)checkDeviceStats
{
    NSString * str;
    if ([AppUtil isBlankString:modelOt.retVal[@"mid"]]) {
        str = Mid_S;
    }else
    {
        str = modelOt.retVal[@"mid"];
    }
    [[ShareWork sharedManager]DeviceStats:str complete:^(BaseModel * model) {
        
        if ([model.retCode isEqualToString:@"0000"]) {
            if ([AppUtil isBlankString:model.retVal[@"status"]]) {
                strState = [NSString stringWithFormat:@"%@",@"ds000"];
            }else{
                strState = [NSString stringWithFormat:@"%@",model.retVal[@"status"]];
                Mid_D =model.retVal[@"deviceno"];
                Mid_T = model.retVal[@"termid"];
                DeviceNum =model.retVal[@"deviceno"];
            }
        }// 没有设备
        else if ([model.totalrecords isEqualToString:@"0"])
        {
            strState = [NSString stringWithFormat:@"%@",@"ds000"];
        }
        [self UIchangeMothod];
    }];
}


// UI变化
-(void)UIchangeMothod
{
    // 设备不存在
    if ([strState isEqualToString:@"ds000"]) {
        [bgImage setImage:[UIImage imageNamed:@"egg_nodevcie"]];
        addBtn.hidden = NO;
        openVideoBtn.hidden = YES;
        SbgImage.hidden = YES;
        [self showBarBtn:YES];
        return;
    }else
    {
        
        IkonwBtn.hidden = YES;
        //设备在线
        if ([strState isEqualToString:@"ds001"]) {
            [bgImage setImage:[UIImage imageNamed:@"online_e"]];
            openVideoBtn.hidden = NO;
        }
        //离线
        if ([strState isEqualToString:@"ds002"]) {
            openVideoBtn.hidden = NO;
            [bgImage setImage:[UIImage imageNamed:@"offline_e"]];
        }
        // 通话中
        if ([strState isEqualToString:@"ds003"]) {
            openVideoBtn.hidden = NO;
            [bgImage setImage:[UIImage imageNamed:@"busy_e"]];
        }
        //正在上传文件
        if ([strState isEqualToString:@"ds004"]) {
            openVideoBtn.hidden = NO;
            [bgImage setImage:[UIImage imageNamed:@"busy_e"]];
        }
        
       
            [self showBarBtn:NO];
            addBtn.hidden = YES;
    }
}
// +号功能显示
- (void)showBarBtn:(BOOL)hide
{
    
    if (Isother) {
        hide = YES;
    }else
    {
        hide = hide;
    }
    [self showBarButton:NAV_RIGHT imageName:@"egg_add_nav" hide:hide];
    
    
    
    
        if ([strState isEqualToString:@"ds001"]) {

             openVideoBtn.layer.borderColor =[UIColor whiteColor].CGColor;
            openVideoBtn.userInteractionEnabled = YES;
        }else{
             openVideoBtn.layer.borderColor = GRAY_COLOR.CGColor;
             openVideoBtn.userInteractionEnabled = NO;
            
            
        }
    
    
}

#pragma make ---------------------------tools

//绑定设备
-(void)btn_add:(UIButton *)sender
{
    BindingViewController * bindVC =[[BindingViewController alloc]init];
    [self.navigationController pushViewController:bindVC animated:NO];
    
}

// 设置选项
// wifi
- (void)wifiTouch:(UIButton *)sender
{
    WifiViewController * wifiVC =[[WifiViewController alloc]init];
    [self.navigationController pushViewController:wifiVC animated:NO];
    
}
// 解除绑定
- (void)bdinTouch:(UIButton *)sender
{
    BindingViewController * bandVC =[[BindingViewController alloc]init];
    bandVC.strTT =DeviceNum;
    [self.navigationController pushViewController:bandVC animated:NO];
    
    
}

/**
 开始视频
 
 @param sender btn
 */
- (void)OpenVideo:(UIButton *)sender
{
    NSString * strDevicenume =[Defaluts objectForKey:PREF_DEVICE_NUMBER];
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    if ([AppUtil isBlankString:modelOt.retVal[@"deviceno"]]) {
        if ([AppUtil isBlankString:Mid_D]) {
            [self sipCall:strDevicenume sipName:nil];
        }else
        {
            [self sipCall:Mid_D sipName:nil];
        }
        
        if ([strState isEqualToString:@"ds001"]) {
            [[ShareWork sharedManager]DeviceUseMember:Mid_S object:@"self" deviceno:Mid_D belong:Mid_S starttime:locationString complete:^(BaseModel * model) {
                [Defaluts setObject:model.content forKey:@"selfID"];
                [Defaluts synchronize];
            }];
        }else
        {
            return;
        }
        
    }else
    {
         [self sipCall:modelOt.retVal[@"deviceno"] sipName:nil];
        
        if ([strState isEqualToString:@"ds001"]) {
            [[ShareWork sharedManager]DeviceUseMember:Mid_S object:@"other" deviceno:modelOt.retVal[@"deviceno"] belong:modelOt.retVal[@"mid"] starttime:locationString complete:^(BaseModel * model) {
                [Defaluts setObject:model.content forKey:@"selfID"];
                [Defaluts synchronize];
            }];
        }else
        {
            return;
        }
        
    }
    
    
}

// 设置按钮点击
- (void)doRightButtonTouch
{

    if (SbgImage.hidden) {
        SbgImage.hidden = NO;
        
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            SbgImage.hidden = YES;
            
        } completion:^(BOOL finished) {
            // [setImage removeFromSuperview];
        }];
        return;
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Event Functions

//  call
/*
 @dialerNumber 别人的账号
 @sipName 自己的账号
 @ 视频通话
 */
- (void)sipCall:(NSString*)dialerNumber sipName:(NSString *)sipName
{
    NSString *  displayName  =nil;
    [[SephoneManager instance] call:dialerNumber displayName:displayName transfer:FALSE];
}



@end
