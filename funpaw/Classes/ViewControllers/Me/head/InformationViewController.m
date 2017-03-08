//
//  InformationViewController.m
//  funpaw
//
//  Created by czx on 2017/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationTableViewCell.h"
#import "ShareWork+PersonMember.h"
#import "LoginModel.h"

static NSString * cellId = @"InformationCellId";
@interface InformationViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) UIButton * headBtn;
@property (nonatomic,strong) UIImageView * headImage;
@property (nonatomic,strong)NSArray * nameArray;
@property (nonatomic,strong)UIButton * bigBtn;
@property (nonatomic,strong)UIView * centerwhteView;
@property (nonatomic,strong) UITextField * exchangeTextfield;

@property (nonatomic,strong)UIView * downWithView;
@property (nonatomic,strong)UIButton * coverButton;
@property (nonatomic,strong)UIView * littleDownView;
@property(nonatomic,strong)UIImagePickerController * imagePicker;
@property (nonatomic,strong)NSString * picstr;
@property (nonatomic,strong)UIDatePicker * datePicker;
@property (nonatomic,strong)UIView * bigView;
@property (nonatomic,strong)UIButton * bigButton;
@property (nonatomic,strong)UIButton * wanchengBtn;



@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LIGHT_GRAY_COLOR;
    [self setNavTitle:@"昵称"];
    _imagePicker =[[UIImagePickerController alloc]init];
    _imagePicker.delegate= self;
}

-(void)setupView{
    [super setupView];
    UIView * topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.superview);
        make.right.equalTo(topView.superview);
        make.top.equalTo(topView.superview).offset(12);
        make.height.mas_offset(80);
    }];
    
    UILabel * headLabel = [[UILabel alloc]init];
    headLabel.text = @"头像";
    headLabel.textColor = [UIColor blackColor];
    headLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:headLabel];
    [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.mas_centerY);
        make.left.equalTo(headLabel.superview).offset(12);
        
    }];
    
    _headBtn = [[UIButton alloc]init];
    // [_headBtn.layer setMasksToBounds:YES];
    //   _headBtn.layer.cornerRadius = 33;
    [_headBtn addTarget:self action:@selector(headbtuttonTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headBtn];
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headBtn.superview).offset(-12);
        make.top.equalTo(topView.mas_top).offset(7);
        make.bottom.equalTo(topView.mas_bottom).offset(-7);
        make.width.mas_offset(66);
    }];
    
    _headImage = [[UIImageView alloc]init];
    _headImage.backgroundColor = [UIColor clearColor];
    _headImage.layer.cornerRadius = 33;
    [_headImage.layer setMasksToBounds:YES];
    [_headImage sd_setImageWithURL:[NSURL URLWithString:[AccountManager sharedAccountManager].loginModel.headportrait] placeholderImage:[UIImage imageNamed:@"sego1.png"]];
    [self.view addSubview:_headImage];
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headImage.superview).offset(-12);
        make.top.equalTo(topView.mas_top).offset(7);
        make.bottom.equalTo(topView.mas_bottom).offset(-7);
        make.width.mas_offset(66);
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(12);
        make.left.equalTo(self.tableView.superview);
        make.right.equalTo(self.tableView.superview);
        make.height.mas_equalTo(165);
        
    }];
    [self.tableView registerClass:[InformationTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.scrollEnabled = NO;
    
}

-(void)setupData{
    [super setupData];
    [[ShareWork sharedManager]queryByIdMemberWithMid:Mid_S complete:^(BaseModel *model) {
        LoginModel * loginModel = [[LoginModel alloc]initWithDictionary:model.retVal error:nil];
        [[AccountManager sharedAccountManager]login:loginModel];

    }];

    _nameArray = [[NSArray alloc]init];
    _nameArray = @[@"账号",@"手机",@"昵称"];
    


}





-(void)headbtuttonTouch:(UIButton *)sender{
    // FuckLog([AccountManager sharedAccountManager].loginModel.pet_sex);
    _downWithView = [[UIView alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 667 * W_Hight_Zoom, 375 * W_Wide_Zoom, 80 * W_Hight_Zoom)];
    _littleDownView = [[UIView alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 667 * W_Hight_Zoom, 375 * W_Wide_Zoom, 40 * W_Hight_Zoom)];
    _coverButton = [[UIButton alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 0 * W_Hight_Zoom, 375 * W_Wide_Zoom, 667 * W_Hight_Zoom)];
    _coverButton.backgroundColor = [UIColor blackColor];
    _coverButton.alpha = 0.4;
    [[UIApplication sharedApplication].keyWindow addSubview:_coverButton];
    [_coverButton addTarget:self action:@selector(hideButton:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.3 animations:^{
        _downWithView.frame = CGRectMake(0 * W_Wide_Zoom, 543 * W_Hight_Zoom, 375 * W_Wide_Zoom, 80 * W_Hight_Zoom);
        _littleDownView.frame = CGRectMake(0 * W_Wide_Zoom, 627 * W_Hight_Zoom, 375 * W_Wide_Zoom, 40 * W_Hight_Zoom);
        _littleDownView.backgroundColor = [UIColor whiteColor];
        _downWithView.backgroundColor = [UIColor whiteColor];
        [[UIApplication sharedApplication].keyWindow addSubview:_littleDownView];
        [[UIApplication sharedApplication].keyWindow addSubview:_downWithView];
    }];
    NSArray * nameArray = @[@"拍照",@"相册"];
    for (int i = 0; i < 2; i++) {
        UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 0 * W_Hight_Zoom + i * 40 * W_Hight_Zoom, 375 * W_Wide_Zoom, 1 * W_Hight_Zoom)];
        lineLabel.backgroundColor = GRAY_COLOR;
        [_downWithView addSubview:lineLabel];
        
        UIButton * downButtones = [[UIButton alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 0 * W_Hight_Zoom + i * 40 * W_Hight_Zoom, 375 * W_Wide_Zoom, 40 * W_Hight_Zoom)];
        [downButtones setTitle:nameArray[i] forState:UIControlStateNormal];
        [downButtones setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        downButtones.titleLabel.font = [UIFont systemFontOfSize:14];
        [_downWithView addSubview:downButtones];
        downButtones.tag = i;
        [downButtones addTarget:self action:@selector(imageButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton * quxiaoButton = [[UIButton alloc]initWithFrame:CGRectMake(0 * W_Wide_Zoom, 0 * W_Hight_Zoom, 375 * W_Wide_Zoom, 40 * W_Hight_Zoom)];
    [quxiaoButton setTitle:@"取消"forState:UIControlStateNormal];
    [quxiaoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    quxiaoButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_littleDownView addSubview:quxiaoButton];
    [quxiaoButton addTarget:self action:@selector(hideButton:) forControlEvents:UIControlEventTouchUpInside];



}
-(void)hideButton:(UIButton *)sender{
    _coverButton.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        _downWithView.frame = CGRectMake(0 * W_Wide_Zoom, 667 * W_Hight_Zoom, 375 * W_Wide_Zoom, 80 * W_Hight_Zoom);
        _littleDownView.frame = CGRectMake(0 * W_Wide_Zoom, 667 * W_Hight_Zoom, 375 * W_Wide_Zoom, 40 * W_Hight_Zoom);
    }];
}

-(void)imageButtonTouch:(UIButton *)sender{
    if (sender.tag == 0) {
        [self takePhoto];
    }else{
        [self loacalPhoto];
    }
    
}

- (void)takePhoto
{
    [self hideButton:nil];
    // 拍照
    NSArray * mediaty = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.mediaTypes = @[mediaty[0]];
        //设置相机模式：1摄像2录像
        _imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //使用前置还是后置摄像头
        _imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        //闪光模式
        _imagePicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        _imagePicker.allowsEditing = YES;
    }else
    {
        NSLog(@"打开摄像头失败");
    }
    [self presentViewController:_imagePicker animated:YES completion:nil];
    
    
}


- (void)loacalPhoto
{
    [self hideButton:nil];
    NSArray * mediaTypers = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagePicker.mediaTypes = @[mediaTypers[0],mediaTypers[1]];
        _imagePicker.allowsEditing = YES;
    }
    [self presentViewController:_imagePicker animated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSDateFormatter * formater =[[NSDateFormatter alloc]init];
    
    UIImage * showImage = info[UIImagePickerControllerEditedImage];
    NSLog(@"wocaocao:%@",showImage);
    
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"handImageText" object:showImage];
    // _headImage.image = showImage;
    //  [_headBtn setImage:showImage forState:UIControlStateNormal];
    _headImage.image = showImage;
    NSData * data = UIImageJPEGRepresentation(showImage,1.0f);
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    [formater stringFromDate:[NSDate date]];
    NSString *picname1 = [NSString stringWithFormat:@"%@.jpg",[formater stringFromDate:[NSDate date]]];
    
    NSString * pictureDataString = [data base64EncodedStringWithOptions:0];
    // NSLog(@"%@",pictureDataString);
    
    _picstr = [NSString stringWithFormat:@"[{\"%@\":\"%@\",\"%@\":\"%@\"}]",@"name",picname1,@"content",pictureDataString];
    [self changgeheadRequest];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)changgeheadRequest{
    
    [self showHudInView:self.view hint:@"修改中..."];
//    [[AFHttpClient sharedAFHttpClient]modifyHeadportraitWithMid: [AccountManager sharedAccountManager].loginModel.mid picture:_picstr complete:^(BaseModel *model) {
//        [self hideHud];
//        [[AppUtil appTopViewController] showHint:NSLocalizedString(@"info_re_su", nil)];
//        LoginModel * loginModel = [[LoginModel alloc]initWithDictionary:model.retVal error:nil];
//        [[AccountManager sharedAccountManager]login:loginModel];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"meshuashua" object:nil];
//        
//    }];
    [[ShareWork sharedManager]modifyHeadportraitWithMid:Mid_S picture:_picstr complete:^(BaseModel *model) {
        [self hideHud];
        if ([model.retCode isEqualToString:@"0000"]) {
            [[AppUtil appTopViewController] showHint:@"修改成功"];
            LoginModel * loginModel = [[LoginModel alloc]initWithDictionary:model.retVal error:nil];
            [[AccountManager sharedAccountManager]login:loginModel];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"meshuashua" object:nil];
        }else{
            [[AppUtil appTopViewController] showHint:model.retDesc];
        }
      
        
    }];
    
    
}



#pragma mark - TableView的代理函数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.nameLabel.text = _nameArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.rightLabel.text = [AccountManager sharedAccountManager].loginModel.accountnumber;
    }
    if (indexPath.row == 1) {
        if ([AppUtil isBlankString:[AccountManager sharedAccountManager].loginModel.phone]) {
            cell.rightLabel.text = @"无";
        }else{
        cell.rightLabel.text = [AccountManager sharedAccountManager].loginModel.phone;
        }
        
        
    }
    if (indexPath.row == 2) {
        cell.rightLabel.text = [AccountManager sharedAccountManager].loginModel.nickname;
    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
         [self exchangename];
    }



}
-(void)exchangename{
    // 通过数据控制界面
    //[AccountManager sharedAccountManager].loginModel.nickname = @"dadada";
    //[self.tableView reloadData];
    //FuckLog(@"修改昵称");
    [self bigButtonOpen:1];
}
-(void)bigbuttonTouch{
    // _bigBtn.hidden = YES;
    //_centerwhteView.hidden = YES;
    [_exchangeTextfield resignFirstResponder];
    
    
}


-(void)bigButtonOpen:(NSInteger)i{
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
    if (i == 1) {
        [self exchangnameview];
    }
  
    
    
}
#pragma mark - 改名字
//修改名字
-(void)exchangnameview{
    //_centerwhteView.backgroundColor = [UIColor redColor];
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"修改昵称";
    nameLabel.textColor = [UIColor blackColor];
    // nameLabel.text = [AccountManager sharedAccountManager].loginModel.nickname;
    nameLabel.font = [UIFont systemFontOfSize:17.5];
    [_centerwhteView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(nameLabel.superview.mas_centerX);
        make.top.equalTo(nameLabel.superview).offset(14);
        
    }];
    
    _exchangeTextfield = [[UITextField alloc]init];
    _exchangeTextfield.placeholder = @"请输入昵称(11字以内)";
    _exchangeTextfield.text = [AccountManager sharedAccountManager].loginModel.nickname;
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
    // FuckLog(@"不改名字了");
    [_exchangeTextfield resignFirstResponder];
    _bigBtn.hidden = YES;
    _centerwhteView.hidden = YES;
}
-(void)namesurebuttonTouch{
    // FuckLog(@"还是改个名字吧");
    if ([AppUtil isBlankString:_exchangeTextfield.text]) {
        [[AppUtil appTopViewController] showHint:@"请输入名字"];
        return;
    }
    if (_exchangeTextfield.text.length > 11) {
        [[AppUtil appTopViewController] showHint:@"字数不能超过11个字哦"];
        return;
    }
    [_exchangeTextfield resignFirstResponder];
    _bigBtn.hidden = YES;
    _centerwhteView.hidden = YES;
     [self showHudInView:self.view hint:@"修改中..."];
    [[ShareWork sharedManager]modifyMemberWithMid:Mid_S nickname:_exchangeTextfield.text complete:^(BaseModel *model) {
         [self hideHud];
        if (model) {
            [[AppUtil appTopViewController] showHint:@"修改成功"];
            LoginModel * loginModel = [[LoginModel alloc]initWithDictionary:model.retVal error:nil];
            [[AccountManager sharedAccountManager]login:loginModel];
            [self.tableView reloadData];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"meshuashua" object:nil];
        }
    }];
    
    
}



@end
