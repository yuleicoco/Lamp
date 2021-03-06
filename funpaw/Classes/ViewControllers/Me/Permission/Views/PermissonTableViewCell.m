//
//  PermissonTableViewCell.m
//  sego2.0
//
//  Created by czx on 16/12/11.
//  Copyright © 2016年 yulei. All rights reserved.
//

#import "PermissonTableViewCell.h"

@implementation PermissonTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn setImage:[UIImage imageNamed:@"weixuanzhong1.png"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"xuanzhongzhong.png"] forState:UIControlStateSelected];
        _leftBtn.selected = NO;
        [self addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftBtn.superview).offset(12);
            make.centerY.equalTo(_leftBtn.superview.mas_centerY);
          
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(23);
            
        }];
        
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = LIGHT_GRAYdcdc_COLOR;
        [self addSubview:_lineLabel];
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_lineLabel.superview).offset(12);
            make.right.equalTo(_lineLabel.superview).offset(-12);
            make.top.equalTo(_lineLabel.superview);
            make.height.mas_equalTo(1);
        }];
        
        _guizeNameLabel = [[UILabel alloc]init];
        _guizeNameLabel.textColor = SKY_bLUE_COLOR;
        _guizeNameLabel.text = @"默认规则";
        _guizeNameLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_guizeNameLabel];
        [_guizeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftBtn.mas_right).offset(15);
            make.centerY.equalTo(_guizeNameLabel.superview.mas_centerY);
            
        }];
        
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_leftLabel.superview).offset(-15);
           // make.bottom.equalTo(_leftLabel.superview).offset(-9);
            make.centerY.equalTo(_leftLabel.superview.mas_centerY);
        }];
        
        _toushiLabel = [[UILabel alloc]init];
        _toushiLabel.text = NSLocalizedString(@"as_toushi", nil);
        _toushiLabel.font = [UIFont systemFontOfSize:15];
        _toushiLabel.textColor = [UIColor blackColor];
        [self addSubview:_toushiLabel];
        [_toushiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_toushiLabel.superview).offset(180);
            make.bottom.equalTo(_toushiLabel.superview).offset(-9);
        }];
        
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.textColor = [UIColor blackColor];
        _rightLabel.font = [UIFont systemFontOfSize:15];
        _rightLabel.text = @"允许";
        [self addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_toushiLabel.mas_right).offset(10);
            make.bottom.equalTo(_toushiLabel.superview).offset(-9);
        }];
        
        
        
        
        
        
        
        
        
        
    }




    return self;
}



@end
