//
//  MeViewController.m
//  funpaw
//
//  Created by czx on 2017/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "MeViewController.h"
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "InformationViewController.h"
#import "PermissionViewController.h"
#import "ExchangPasswordViewController.h"
#import "AboutViewController.h"
#import "FriendViewController.h"

@interface MeViewController ()
@property(nonatomic,strong)UILabel * nameLabel;
@property(nonatomic,strong)UIButton * headBtn;
@property (nonatomic,strong)UIImageView * headImage;
@property (nonatomic,strong)UIButton * redBtn;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setNavTitle:@"我的"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults * tipUser = [NSUserDefaults standardUserDefaults];
    NSString * tipstr = [tipUser objectForKey:@"countfoucetip"];
    if ([tipstr isEqualToString:@"0"]) {
        _redBtn.hidden = YES;
    }else{
        _redBtn.hidden = NO;
        [_redBtn setTitle:tipstr forState:UIControlStateNormal];
        
    }
    //  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cleanTip) name:@"isreaddd" object:nil];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeName) name:@"meshuashua" object:nil];
     self.navigationController.navigationBarHidden = YES;
}
-(void)changeName{
    _nameLabel.text = [AccountManager sharedAccountManager].loginModel.nickname;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:[AccountManager sharedAccountManager].loginModel.headportrait] placeholderImage:[UIImage imageNamed:@"sego1.png"]];

}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
     self.navigationController.navigationBarHidden = NO;
}




-(void)setupView{
    [super setupView];
    self.view.backgroundColor = LIGHT_GRAY_COLOR;
    UIImageView * topImage = [[UIImageView alloc]init];
    // topImage.backgroundColor= [UIColor redColor];
    topImage.image = [UIImage imageNamed:@"mebackkk.png"];
    [self.view addSubview:topImage];
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImage.superview);
        make.left.equalTo(topImage.superview);
        make.right.equalTo(topImage.superview);
        make.height.mas_equalTo(219);
        
    }];
    
    UILabel * meLabel = [[UILabel alloc]init];
    meLabel.text = @"我的";
    meLabel.textColor = [UIColor whiteColor];
    meLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:meLabel];
    [meLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(meLabel.superview);
        make.top.equalTo(meLabel.superview.mas_top).offset(27);
        
    }];
    
    
    
    
    _headBtn = [[UIButton alloc]init];
    _headBtn.backgroundColor = [UIColor clearColor];
    [_headBtn addTarget:self action:@selector(headbuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headBtn];
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headBtn.superview).offset(68);
        make.left.equalTo(_headBtn.superview).offset(147);
        make.right.equalTo(_headBtn.superview).offset(-147);
        make.height.mas_equalTo(80);
        
    }];
    
    
    _headImage = [[UIImageView alloc]init];
    _headImage.backgroundColor = [UIColor clearColor];
    _headImage.layer.cornerRadius = 40;
    [_headImage.layer setMasksToBounds:YES];
    _headImage.layer.borderWidth = 2;
    _headImage.layer.borderColor =RGB(128, 212, 245).CGColor;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:[AccountManager sharedAccountManager].loginModel.headportrait] placeholderImage:[UIImage imageNamed:@"sego1.png"]];
    [self.view addSubview:_headImage];
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImage.superview).offset(68);
        //  make.left.equalTo(_headImage.superview).offset(147);
        make.centerX.equalTo(_headImage.superview);
        //  make.right.equalTo(_headImage.superview).offset(-147);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    

    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.text = [AccountManager sharedAccountManager].loginModel.nickname;
    _nameLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_headBtn.mas_centerX);
        make.top.equalTo(_headBtn.mas_bottom).offset(12);
        
    }];
    
//    UILabel * linelabel = [[UILabel alloc]init];
//    linelabel.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:linelabel];
//    [linelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(_nameLabel.mas_centerX);
//        make.top.equalTo(_nameLabel.mas_bottom).offset(16);
//        make.width.mas_equalTo(1);
//        make.bottom.equalTo(topImage.mas_bottom).offset(-18);
//        
//    }];
    
//    UILabel * wenzhangNum = [[UILabel alloc]init];
//    wenzhangNum.textColor = [UIColor whiteColor];
//    wenzhangNum.font = [UIFont systemFontOfSize:15];
//  //  wenzhangNum.text = [AccountManager sharedAccountManager].loginModel.articles;
//    [self.view addSubview:wenzhangNum];
//    [wenzhangNum mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(linelabel.mas_left).offset(-16);
//        make.centerY.equalTo(linelabel.mas_centerY);
//        
//    }];
//    
//    UILabel * wenzhang = [[UILabel alloc]init];
//    wenzhang.text = @"文章";
//    wenzhang.textColor = [UIColor whiteColor];
//    wenzhang.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:wenzhang];
//    [wenzhang mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(wenzhangNum.mas_left).offset(-7);
//        make.centerY.equalTo(wenzhangNum.mas_centerY);
//        
//    }];
//    
//    UILabel * haoyou = [[UILabel alloc]init];
//    haoyou.text = @"好友";
//    haoyou.textColor = [UIColor whiteColor];
//    haoyou.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:haoyou];
//    [haoyou mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(haoyou.superview.mas_centerX);
//        make.top.equalTo(_nameLabel.mas_centerY).offset(10);
//        
//    }];
//    
//    UILabel * haoyouNum = [[UILabel alloc]init];
//    haoyouNum.textColor = [UIColor whiteColor];
//    haoyouNum.text = [AccountManager sharedAccountManager].loginModel.friends;
//    haoyouNum.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:haoyouNum];
//    [haoyouNum mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(haoyou.mas_right).offset(7);
//        make.centerY.equalTo(haoyou.mas_centerY);
//        
//    }];
    
    //第一坨
    UIView * firstView = [[UIView alloc]init];
    firstView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImage.mas_bottom);
        make.left.equalTo(firstView.superview);
        make.right.equalTo(firstView.superview);
        make.height.mas_equalTo(120);
        
    }];
    
    UILabel * centerLabel = [[UILabel alloc]init];
    centerLabel.backgroundColor = LIGHT_GRAYdcdc_COLOR;
    [self.view addSubview:centerLabel];
    [centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(firstView.mas_centerY);
        make.left.equalTo(centerLabel.superview).offset(12);
        make.right.equalTo(centerLabel.superview).offset(-12);
        make.height.mas_equalTo(0.5);
        
    }];
    
    UIImageView * doumaImage = [[UIImageView alloc]init];
    doumaImage.image = [UIImage imageNamed:@"goodfriend.png"];
    [self.view addSubview:doumaImage];
    [doumaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(doumaImage.superview).offset(13);
        make.top.equalTo(firstView.mas_top).offset(18);
        make.bottom.equalTo(centerLabel.mas_top).offset(-18);
        make.width.mas_equalTo(21);
        
        
    }];
    
    UILabel * doumaLabel = [[UILabel alloc]init];
    doumaLabel.text = @"好友";
    doumaLabel.textColor = [UIColor blackColor];
    doumaLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:doumaLabel];
    [doumaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(doumaImage.mas_right).offset(16);
        make.centerY.equalTo(doumaImage.mas_centerY);
        
    }];
    
    UIImageView * rightjian1 = [[UIImageView alloc]init];
    rightjian1.image = [UIImage imageNamed:@"rightjian.png"];
    [self.view addSubview:rightjian1];
    [rightjian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightjian1.superview).offset(-13);
        make.top.equalTo(firstView.mas_top).offset(21);
        make.bottom.equalTo(centerLabel.mas_top).offset(-21);
        make.width.mas_equalTo(9);
       // make.height.mas_equalTo(10);
        
        
        
    }];
    

    
    _redBtn = [[UIButton alloc]init];
    _redBtn.backgroundColor = [UIColor redColor];
    _redBtn.layer.cornerRadius = 10;
      [_redBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     _redBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_redBtn];
    [_redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightjian1.mas_left).offset(-16);
        make.centerY.equalTo(doumaImage.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
        
    }];
    
    
    
    
    
    
    
    
    
    
    UIButton * doumaBtn = [[UIButton alloc]init];
    doumaBtn.backgroundColor = [UIColor clearColor];
    [doumaBtn addTarget:self action:@selector(doumabuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doumaBtn];
    [doumaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_top);
        make.bottom.equalTo(centerLabel.mas_top);
        make.left.equalTo(doumaBtn.superview);
        make.right.equalTo(doumaBtn.superview);
    }];
    
    UIImageView * quanxianImage = [[UIImageView alloc]init];
    quanxianImage.image=  [UIImage imageNamed:@"quanxian.png"];
    [self.view addSubview:quanxianImage];
    [quanxianImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(quanxianImage.superview).offset(13);
        make.top.equalTo(centerLabel.mas_bottom).offset(19);
        make.bottom.equalTo(firstView.mas_bottom).offset(-19);
        make.width.mas_offset(22);
    }];
    
    
    UILabel * quanxianLabel = [[UILabel alloc]init];
    quanxianLabel.text = @"权限设置";
    quanxianLabel.textColor = [UIColor blackColor];
    quanxianLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:quanxianLabel];
    [quanxianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(quanxianImage.mas_right).offset(16);
        make.centerY.equalTo(quanxianImage.mas_centerY);
    }];
    
    UIImageView * rightjian2 = [[UIImageView alloc]init];
    rightjian2.image = [UIImage imageNamed:@"rightjian.png"];
    [self.view addSubview:rightjian2];
    [rightjian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightjian2.superview).offset(-13);
        make.top.equalTo(centerLabel.mas_top).offset(21);
        make.bottom.equalTo(firstView.mas_bottom).offset(-21);
        make.width.mas_equalTo(9);
        // make.height.mas_equalTo(10);
        
    }];
    

    UIButton * quanxianBtn = [[UIButton alloc]init];
    quanxianBtn.backgroundColor = [UIColor clearColor];
    [quanxianBtn addTarget:self action:@selector(quanxianbuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quanxianBtn];
    [quanxianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerLabel.mas_bottom);
        make.bottom.equalTo(firstView.mas_bottom);
        make.left.equalTo(doumaBtn.superview);
        make.right.equalTo(doumaBtn.superview);
    }];
    
    

    //第二坨
    UIView * secoendView = [[UIView alloc]init];
    secoendView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:secoendView];
    [secoendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom).offset(12);
        make.left.equalTo(firstView.superview);
        make.right.equalTo(firstView.superview);
        make.height.mas_equalTo(120);
        
    }];
    
    UILabel * centerlabel2 = [[UILabel alloc]init];
    centerlabel2.backgroundColor = LIGHT_GRAYdcdc_COLOR;
    [self.view addSubview:centerlabel2];
    [centerlabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(secoendView.mas_centerY);
        make.left.equalTo(centerLabel.superview).offset(12);
        make.right.equalTo(centerLabel.superview).offset(-12);
        make.height.mas_equalTo(0.5);
        
    }];
    
    UIImageView * exchangeImage = [[UIImageView alloc]init];
    exchangeImage.image = [UIImage imageNamed:@"exchangepassword.png"];
    [self.view addSubview:exchangeImage];
    [exchangeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(exchangeImage.superview).offset(12);
        make.top.equalTo(secoendView.mas_top).offset(19);
        make.bottom.equalTo(centerlabel2.mas_top).offset(-19);
        make.width.mas_equalTo(22);
        
    }];
    
    UILabel * exchangeLabel = [[UILabel alloc]init];
    exchangeLabel.text = @"修改密码";
    exchangeLabel.textColor = [UIColor blackColor];
    exchangeLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:exchangeLabel];
    [exchangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(exchangeImage.mas_right).offset(16);
        make.centerY.equalTo(exchangeImage.mas_centerY);
    }];
    
    UIImageView * rightjian3 = [[UIImageView alloc]init];
    rightjian3.image = [UIImage imageNamed:@"rightjian.png"];
    [self.view addSubview:rightjian3];
    [rightjian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightjian3.superview).offset(-13);
        make.top.equalTo(secoendView.mas_top).offset(21);
        make.bottom.equalTo(centerlabel2.mas_top).offset(-21);
        make.width.mas_equalTo(9);
        // make.height.mas_equalTo(10);
        
        
        
    }];
    
    
    
    
    UIButton * exchangBtn = [[UIButton alloc]init];
    exchangBtn.backgroundColor = [UIColor clearColor];
    [exchangBtn addTarget:self action:@selector(exchangebuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exchangBtn];
    [exchangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secoendView.mas_top);
        make.bottom.equalTo(centerlabel2.mas_top);
        make.left.equalTo(doumaBtn.superview);
        make.right.equalTo(doumaBtn.superview);
    }];
    
    UIImageView * aboutImage = [[UIImageView alloc]init];
    aboutImage.image = [UIImage imageNamed:@"about.png"];
    [self.view addSubview:aboutImage];
    [aboutImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(aboutImage.superview).offset(13);
        make.top.equalTo(centerlabel2.mas_bottom).offset(20);
        make.bottom.equalTo(secoendView.mas_bottom).offset(-19);
        make.width.mas_equalTo(22);
    }];
    
    UILabel * aboutLabel = [[UILabel alloc]init];
    aboutLabel.text = @"关于";
    aboutLabel.textColor = [UIColor blackColor];
    aboutLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:aboutLabel];
    [aboutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(aboutImage.mas_right).offset(16);
        make.centerY.equalTo(aboutImage.mas_centerY);
        
    }];
    
    UIImageView * rightjian4 = [[UIImageView alloc]init];
    rightjian4.image = [UIImage imageNamed:@"rightjian.png"];
    [self.view addSubview:rightjian4];
    [rightjian4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightjian4.superview).offset(-13);
        make.top.equalTo(centerlabel2.mas_top).offset(21);
        make.bottom.equalTo(secoendView.mas_bottom).offset(-21);
        make.width.mas_equalTo(9);
        // make.height.mas_equalTo(10);
        
    }];
    
    
    
    
    
    UIButton * aboutBtn = [[UIButton alloc]init];
    aboutBtn.backgroundColor = [UIColor clearColor];
    [aboutBtn addTarget:self action:@selector(aboutbuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aboutBtn];
    [aboutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerlabel2.mas_bottom);
        make.bottom.equalTo(secoendView.mas_bottom);
        make.left.equalTo(doumaBtn.superview);
        make.right.equalTo(doumaBtn.superview);
    }];
    
    
    
    UIView * lastView = [[UIView alloc]init];
    lastView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lastView];
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secoendView.mas_bottom).offset(36);
        make.left.equalTo(firstView.superview);
        make.right.equalTo(firstView.superview);
        make.height.mas_equalTo(55);
    }];
    
    UILabel * loginoutLabel = [[UILabel alloc]init];
    loginoutLabel.text = @"退出";
    loginoutLabel.textColor = [UIColor blackColor];
    loginoutLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:loginoutLabel];
    [loginoutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lastView.mas_centerX);
        make.centerY.equalTo(lastView.mas_centerY);
        
    }];
    
    UIButton * loginoutBtn = [[UIButton alloc]init];
    loginoutBtn.backgroundColor = [UIColor clearColor];
    [loginoutBtn addTarget:self action:@selector(loginOutButtontouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginoutBtn];
    [loginoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secoendView.mas_bottom).offset(36);
        make.left.equalTo(firstView.superview);
        make.right.equalTo(firstView.superview);
        make.height.mas_equalTo(55);
    }];
}


//退出登录
-(void)loginOutButtontouch{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"您确定要退出登录?" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLoginStateChange object:@NO];
        [[AccountManager sharedAccountManager]logout];
        
        NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
        NSDictionary *dictionary = [userDefatluts dictionaryRepresentation];
       // NSString * incodeNumStr = [userDefatluts objectForKey:@"incodeNum"];
        
        for(NSString* key in [dictionary allKeys]){
            [userDefatluts removeObjectForKey:key];
            [userDefatluts synchronize];
        }
        [userDefatluts setObject:@"1" forKey:@"STARTFLAG"];
      //  [userDefatluts setObject:incodeNumStr forKey:@"incodeNum"];
    }]];
    [ShareSDK cancelAuthorize:SSDKPlatformTypeQQ];
    [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
    [self presentViewController:alert animated:YES completion:nil];

}

//个人资料
-(void)headbuttonTouch{
    InformationViewController * informationVc = [[InformationViewController alloc]init];
    [self.navigationController pushViewController:informationVc animated:NO];

    
}
//好友
-(void)doumabuttonTouch{
    FriendViewController * friendVc= [[FriendViewController alloc]init];
    [self.navigationController pushViewController:friendVc animated:NO];

}





//权限设置
-(void)quanxianbuttonTouch{
   // FuckLog(@"权限设置");
    NSString * str  =  [Defaluts objectForKey:@"deviceNumber"];
    NSString * str1  = [AccountManager sharedAccountManager].loginModel.deviceno;
    if ([AppUtil isBlankString:str] && [AppUtil isBlankString:str1]) {
        [[AppUtil appTopViewController]showHint:@"您还未绑定设备"];

    }else{
    PermissionViewController * perVc= [[PermissionViewController alloc]init];
    [self.navigationController pushViewController:perVc animated:NO];
    
    }

}

//修改密码
-(void)exchangebuttonTouch{
    if ([AppUtil isBlankString:[AccountManager sharedAccountManager].loginModel.rtype]) {
        ExchangPasswordViewController * exchangeVc = [[ExchangPasswordViewController alloc]init];
        [self.navigationController pushViewController:exchangeVc animated:NO];

    }else{
         [[AppUtil appTopViewController]showHint:@"第三方登录不能修改密码哦!"];
    }
    
   

}

//关于
-(void)aboutbuttonTouch{
    AboutViewController * aboutVc= [[AboutViewController alloc]init];
    [self.navigationController pushViewController:aboutVc animated:NO];



}


@end
