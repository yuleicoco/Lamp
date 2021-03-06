//
//  NewPermissionViewController.m
//  sego2.0
//
//  Created by czx on 16/12/12.
//  Copyright © 2016年 yulei. All rights reserved.
//

#import "NewPermissionViewController.h"
#import "ShareWork+Permission.h"
#import "ZdFriendViewController.h"
@interface NewPermissionViewController ()
@property (nonatomic,strong)UILabel * ruleNameLabel;
@property (nonatomic,strong)UIButton * ruleNameBtn;
@property (nonatomic,strong)UILabel * toushiLabel;
@property (nonatomic,strong)UIButton * toushiBtn;


@property (nonatomic,strong)UIButton * bigBtn;
@property (nonatomic,strong)UIView * centerwhteView;
@property (nonatomic,strong) UITextField * exchangeTextfield;

@property (nonatomic,strong)UIButton * allBtn;
@property (nonatomic,strong)UIButton * friendBtn;
@property (nonatomic,strong)UIButton * zdBtn;


@property (nonatomic,assign)BOOL isXiugai;

@end

@implementation NewPermissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"新建规则"];
    self.view.backgroundColor = LIGHT_GRAY_COLOR;
    _isXiugai = NO;
}

-(void)setupData{
    [super setupData];
}

-(void)setupView{
    [super setupView];
    UIView * topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.superview);
        make.left.equalTo(topView.superview);
        make.right.equalTo(topView.superview);
        make.height.mas_equalTo(60);
    }];
    
//    UILabel * lineLabel = [[UILabel alloc]init];
//    lineLabel.backgroundColor = LIGHT_GRAYdcdc_COLOR;
//    [topView addSubview:lineLabel];
//    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(lineLabel.superview).offset(12);
//        make.right.equalTo(lineLabel.superview).offset(-12);
//        make.centerY.equalTo(lineLabel.superview.mas_centerY);
//        make.height.mas_equalTo(0.5);
//        
//        
//    }];

    UILabel * leftLabel1 = [[UILabel alloc]init];
    leftLabel1.text = @"规则名称";
    leftLabel1.textColor = [UIColor blackColor];
    leftLabel1.font = [UIFont systemFontOfSize:18];
    [topView addSubview:leftLabel1];
    [leftLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLabel1.superview).offset(12);
        make.top.equalTo(leftLabel1.superview).offset(20);
        
        
    }];
    
    
//    UILabel * leftLabel2 = [[UILabel alloc]init];
//    leftLabel2.text = NSLocalizedString(@"as_Accessfood", nil);
//    leftLabel2.textColor = [UIColor blackColor];
//    leftLabel2.font = [UIFont systemFontOfSize:18];
//    [topView addSubview:leftLabel2];
//    [leftLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(leftLabel2.superview).offset(12);
//        make.top.equalTo(lineLabel.mas_bottom).offset(20);
//    }];
    
    _ruleNameLabel = [[UILabel alloc]init];
    _ruleNameLabel.text = @"请输入规则名称";
    _ruleNameLabel.textColor =[UIColor lightGrayColor];
    _ruleNameLabel.font = [UIFont systemFontOfSize:18];
    [topView addSubview:_ruleNameLabel];
    [_ruleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_ruleNameLabel.superview).offset(-12);
        make.top.equalTo(_ruleNameLabel.superview).offset(20);
        
        
    }];
    
    _ruleNameBtn = [[UIButton alloc]init];
    _ruleNameBtn.backgroundColor = [UIColor clearColor];
    [_ruleNameBtn addTarget:self action:@selector(rulebuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_ruleNameBtn];
    [_ruleNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      //  make.left.equalTo(_ruleNameBtn.mas_right).offset(20);
        make.right.equalTo(_ruleNameBtn.superview);
        make.top.equalTo(_ruleNameBtn.superview);
        make.bottom.equalTo(_ruleNameBtn.superview);
        make.width.mas_equalTo(300);
    }];
    
//    _toushiLabel = [[UILabel alloc]init];
//    _toushiLabel.text  = NSLocalizedString(@"as_allow", nil);
//    _toushiLabel.textColor = [UIColor blackColor];
//    _toushiLabel.font = [UIFont systemFontOfSize:18];
//    [topView addSubview:_toushiLabel];
//    [_toushiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(_ruleNameLabel.mas_right);
//        make.top.equalTo(lineLabel.mas_bottom).offset(20);
//    
//    }];
    
//    _toushiBtn = [[UIButton alloc]init];
//    _toushiBtn.backgroundColor = [UIColor clearColor];
//    [topView addSubview:_toushiBtn];
//    [_toushiBtn addTarget:self action:@selector(toushubuttonTouch) forControlEvents:UIControlEventTouchUpInside];
//    [_toushiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(_toushiBtn.superview);
//        make.top.equalTo(lineLabel.mas_bottom);
//         make.bottom.equalTo(_toushiBtn.superview);
//        make.width.mas_equalTo(300);
//        
//    }];
    
    UIView * downView = [[UIView alloc]init];
    downView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downView.superview);
        make.right.equalTo(downView.superview);
        make.top.equalTo(topView.mas_bottom).offset(8);
        make.height.mas_equalTo(121);
        
    }];
    
    UILabel * erbiLabel = [[UILabel alloc]init];
    erbiLabel.text = @"设置谁能访问我的设备";
    erbiLabel.textColor = [UIColor blackColor];
    erbiLabel.font = [UIFont systemFontOfSize:18];
    [downView addSubview:erbiLabel];
    [erbiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(erbiLabel.superview).offset(23);
        make.left.equalTo(erbiLabel.superview).offset(12);
    }];
    
    
    _allBtn = [[UIButton alloc]init];
    _allBtn.layer.borderColor = LIGHT_GRAYdcdc_COLOR.CGColor;
    _allBtn.layer.borderWidth = 1;
    _allBtn.layer.cornerRadius = 3;
    _allBtn.backgroundColor = [UIColor whiteColor];
    [_allBtn setTitle:@"所有人" forState:UIControlStateNormal];
    [_allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _allBtn.selected = NO;
    [_allBtn addTarget:self action:@selector(allButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:_allBtn];
    [_allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(83);
        make.height.mas_equalTo(33);
        make.top.equalTo(erbiLabel.mas_bottom).offset(24);
        make.left.equalTo(_allBtn.superview).offset(31);
    }];
    
    
    _friendBtn = [[UIButton alloc]init];
    _friendBtn.layer.borderColor = LIGHT_GRAYdcdc_COLOR.CGColor;
    _friendBtn.layer.borderWidth = 1;
    _friendBtn.layer.cornerRadius = 3;
    _friendBtn.backgroundColor = [UIColor whiteColor];
    [_friendBtn setTitle:@"好友" forState:UIControlStateNormal];
    [_friendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_friendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _friendBtn.selected = NO;
    [_friendBtn addTarget:self action:@selector(friendButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:_friendBtn];
    [_friendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_allBtn.mas_right).offset(32);
        make.width.mas_equalTo(83);
        make.height.mas_equalTo(33);
        make.top.equalTo(erbiLabel.mas_bottom).offset(24);
        
    }];
    
  //  NSString * langev = langeC;
    _zdBtn = [[UIButton alloc]init];
    _zdBtn.layer.borderColor = LIGHT_GRAYdcdc_COLOR.CGColor;
    _zdBtn.layer.borderWidth = 1;
    _zdBtn.layer.cornerRadius = 3;
    _zdBtn.backgroundColor = [UIColor whiteColor];
   // if ([langev isEqualToString:@"zh-Hans-CN"]) {
            [_zdBtn setTitle:@"指定好友" forState:UIControlStateNormal];
    //}else{
      //      [_zdBtn setTitle:@"Choose" forState:UIControlStateNormal];
    //}

    
    [_zdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_zdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _zdBtn.selected = NO;
    [_zdBtn addTarget:self action:@selector(zdbuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:_zdBtn];
    [_zdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_friendBtn.mas_right).offset(32);
        make.width.mas_equalTo(83);
        make.height.mas_equalTo(33);
        make.top.equalTo(erbiLabel.mas_bottom).offset(24);
        
    }];
    
    UIButton * sureBtn = [[UIButton alloc]init];
    sureBtn.backgroundColor = SKY_bLUE_COLOR;
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    sureBtn.layer.cornerRadius = 3;
    [sureBtn addTarget:self action:@selector(sureButtonTouchh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(340);
        make.height.mas_equalTo(55);
        make.centerX.equalTo(sureBtn.superview.mas_centerX);
        make.bottom.equalTo(sureBtn.superview).offset(-87);
    }];
}

-(void)sureButtonTouchh{
    if (_isXiugai == NO) {
        [[AppUtil appTopViewController] showHint:@"请输入规则名称"];
        return;
    }
    if (_allBtn.selected == NO && _friendBtn.selected == NO && _zdBtn.selected == NO) {
        [[AppUtil appTopViewController] showHint:@"请选择谁能访问我的设备"];
        return;
    }

    NSString * tsNum = @"";
//    if ([_toushiLabel.text isEqualToString:NSLocalizedString(@"me_noshare",nil)]) {
//        tsNum = @"0";
//    }else{
//        tsNum = @"1";
//    }
    
    NSString * objectStr = @"";
     NSMutableArray * array = [[NSMutableArray alloc]init];
     NSString * friendstr = @"";
    if (_allBtn.selected == YES) {
        objectStr = @"all";
    }else if (_friendBtn.selected == YES){
        objectStr = @"friend";
    }else if (_zdBtn.selected == YES){
        objectStr = @"zd";
        NSUserDefaults * FriendUserDefaults = [NSUserDefaults standardUserDefaults];
        array  = [FriendUserDefaults objectForKey:@"friendesId"];
        friendstr =  [array componentsJoinedByString:@","];
    }
    

    
    [self showHudInView:self.view hint:@"新建中..."];
    [[ShareWork sharedManager]ruleSetWithMid:[AccountManager sharedAccountManager].loginModel.mid rulesname:_ruleNameLabel.text object:objectStr friends:friendstr tsnum:tsNum complete:^(BaseModel *model) {
        if (model) {
            [[AppUtil appTopViewController]showHint:model.retDesc];
            [self.navigationController popViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ruleShuaxin" object:nil];
        }

            [self hideHud];
    }];
    
    
    
    
    
    
    
    
    
    
    

}




-(void)allButtonTouch{
    _allBtn.selected = YES;
    _allBtn.backgroundColor = SKY_bLUE_COLOR;
    _zdBtn.selected = NO;
    _zdBtn.backgroundColor = [UIColor whiteColor];
    _friendBtn.selected = NO;
    _friendBtn.backgroundColor = [UIColor whiteColor];
    
    
}


-(void)friendButtonTouch{
    _allBtn.selected = NO;
    _allBtn.backgroundColor = [UIColor whiteColor];
    _zdBtn.selected = NO;
    _zdBtn.backgroundColor = [UIColor whiteColor];
    _friendBtn.selected = YES;
    _friendBtn.backgroundColor = SKY_bLUE_COLOR;

}

-(void)zdbuttonTouch{
    _allBtn.selected = NO;
    _allBtn.backgroundColor = [UIColor whiteColor];
    _zdBtn.selected = YES;
    _zdBtn.backgroundColor = SKY_bLUE_COLOR;
    _friendBtn.selected = NO;
    _friendBtn.backgroundColor = [UIColor whiteColor];
    
    ZdFriendViewController * zdFriendvc= [[ZdFriendViewController alloc]init];
    [self.navigationController pushViewController:zdFriendvc animated:NO];

}




-(void)rulebuttonTouch{
   // FuckLog(@"哈哈");
    _bigBtn = [[UIButton alloc]init];
    _bigBtn.backgroundColor = [UIColor blackColor];
    _bigBtn.alpha = 0.4;
    [[UIApplication sharedApplication].keyWindow addSubview:_bigBtn];
    [_bigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bigBtn.superview);
        make.bottom.equalTo(_bigBtn.superview);
        make.left.equalTo(_bigBtn.superview);
        make.right.equalTo(_bigBtn.superview);
    }];
    [_bigBtn addTarget:self action:@selector(bigbuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    _centerwhteView = [[UIView alloc]init];
    _centerwhteView.backgroundColor = [UIColor whiteColor];
    _centerwhteView.layer.cornerRadius = 5;
    [[UIApplication sharedApplication].keyWindow addSubview:_centerwhteView];
    [_centerwhteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_centerwhteView.superview).offset(60);
        make.right.equalTo(_centerwhteView.superview).offset(-60);
        make.top.equalTo(_centerwhteView.superview).offset(245);
        make.height.mas_equalTo(162);
    }];
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"规则名称";
    nameLabel.textColor = [UIColor blackColor];
    // nameLabel.text = [AccountManager sharedAccountManager].loginModel.nickname;
    nameLabel.font = [UIFont systemFontOfSize:17.5];
    [_centerwhteView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(nameLabel.superview.mas_centerX);
        make.top.equalTo(nameLabel.superview).offset(14);
        
    }];
    
    _exchangeTextfield = [[UITextField alloc]init];
    if (_isXiugai == NO) {
       _exchangeTextfield.text = @"";
    }else{
        _exchangeTextfield.text = _ruleNameLabel.text;
    }
    _exchangeTextfield.placeholder = @"请输入规则名称";
    _exchangeTextfield.textAlignment = NSTextAlignmentCenter;
    _exchangeTextfield.textColor = [UIColor blackColor];
    _exchangeTextfield.font = [UIFont systemFontOfSize:17];
    [_centerwhteView addSubview:_exchangeTextfield];
    [_exchangeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_exchangeTextfield.superview.mas_centerX);
        make.top.equalTo(nameLabel.mas_bottom).offset(26);
        make.width.mas_equalTo(200);
        
    }];
    
    UILabel * henglineLabel = [[UILabel alloc]init];
    henglineLabel.backgroundColor =[UIColor grayColor];
    [_centerwhteView addSubview:henglineLabel];
    [henglineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(henglineLabel.superview);
        make.right.equalTo(henglineLabel.superview);
        make.top.equalTo(_exchangeTextfield.mas_bottom).offset(28);
        make.height.mas_equalTo(0.5);
    }];
    
    UILabel * shuLabel = [[UILabel alloc]init];
    shuLabel.backgroundColor = [UIColor grayColor];
    [_centerwhteView addSubview:shuLabel];
    [shuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(henglineLabel.mas_bottom);
        make.bottom.equalTo(shuLabel.superview);
        make.centerX.equalTo(shuLabel.superview.mas_centerX);
        make.width.mas_equalTo(0.5);
        
    }];
    
    UILabel * danceLabel = [[UILabel alloc]init];
    danceLabel.text = @"取消";
    danceLabel.textColor = [UIColor blackColor];
    danceLabel.font = [UIFont systemFontOfSize:17];
    [_centerwhteView addSubview:danceLabel];
    [danceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(shuLabel.mas_left).offset(-48);
        make.top.equalTo(henglineLabel.mas_bottom).offset(15);
    }];
    
    UILabel * sureLabel = [[UILabel alloc]init];
    sureLabel.text = @"确定";
    sureLabel.textColor = [UIColor blackColor];
    sureLabel.font = [UIFont systemFontOfSize:17];
    [_centerwhteView addSubview:sureLabel];
    [sureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shuLabel.mas_right).offset(48);
        make.top.equalTo(henglineLabel.mas_bottom).offset(15);
    }];
    
    UIButton * danceBtn = [[UIButton alloc]init];
    danceBtn.backgroundColor = [UIColor clearColor];
    [danceBtn addTarget:self action:@selector(namedancebuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [_centerwhteView addSubview:danceBtn];
    [danceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(danceBtn.superview);
        // make.top.equalTo(exchangeTextfield.mas_bottom).offset(28.5);
        make.right.equalTo(shuLabel.mas_left);
        make.bottom.equalTo(danceBtn.superview.mas_bottom);
        make.height.mas_equalTo(51);
    }];
    
    UIButton * sureBtn = [[UIButton alloc]init];
    sureBtn.backgroundColor = [UIColor clearColor];
    [sureBtn addTarget:self action:@selector(namesurebuttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [_centerwhteView addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shuLabel.mas_right);
        make.right.equalTo(sureBtn.superview);
        make.bottom.equalTo(sureBtn.superview.mas_bottom);
        make.height.mas_equalTo(51);
    }];

}

-(void)namedancebuttonTouch{
  //  FuckLog(@"不改名字了");
      [_exchangeTextfield resignFirstResponder];
    _bigBtn.hidden = YES;
    _centerwhteView.hidden = YES;
}
-(void)namesurebuttonTouch{
    if ([AppUtil isBlankString:_exchangeTextfield.text]) {
          [[AppUtil appTopViewController] showHint:@"请输入规则名称"];
        return;
    }
    if (_exchangeTextfield.text.length > 11) {
        [[AppUtil appTopViewController] showHint:@"规则名称只能在11字以内哦"];
        return;
    }
      [_exchangeTextfield resignFirstResponder];
    _ruleNameLabel.text = _exchangeTextfield.text;
    _ruleNameLabel.textColor = [UIColor blackColor];
    _bigBtn.hidden = YES;
    _centerwhteView.hidden = YES;
    _isXiugai = YES;
}

-(void)bigbuttonTouch{
//    _bigBtn.hidden = YES;
//    _centerwhteView.hidden = YES;
     [_exchangeTextfield resignFirstResponder];
}

//-(void)toushubuttonTouch{
//
//        if ([_toushiLabel.text isEqualToString:NSLocalizedString(@"as_allow", nil)]) {
//            _toushiLabel.text = NSLocalizedString(@"me_noshare", nil);
//        }else{
//            _toushiLabel.text = NSLocalizedString(@"as_allow",nil);
//        }
//
//    
//}
//















@end
