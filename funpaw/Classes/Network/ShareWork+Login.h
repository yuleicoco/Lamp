//
//  ShareWork+Login.h
//  funpaw
//
//  Created by czx on 2017/2/23.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (Login)
//获取验证码
-(void)chechWithPhone:(NSString *)phone type:(NSString *)type complete:(void(^)(BaseModel *model))completeBlock;

//注册
-(void)memberRegisterWithPhone:(NSString *)phone password:(NSString *)password  complete:(void(^)(BaseModel *model))completeBlock;

//登录
-(void)memberLoginWithaccountnumber:(NSString *)accountnumber password:(NSString *)password  complete:(void(^)(BaseModel *model))completeBlock;

//忘记密码
-(void)forgetPasswordWithPhone:(NSString *)phone password:(NSString *)password  complete:(void(^)(BaseModel *model))completeBlock;





@end