//
//  ShareWork+Login.m
//  funpaw
//
//  Created by czx on 2017/2/23.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+Login.h"

@implementation ShareWork (Login)
-(void)chechWithPhone:(NSString *)phone type:(NSString *)type complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"phone"] = phone;
    params[@"type"] = type;
    
    [self requestWithMethod:POST WithPath:@"common=check" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];



}

-(void)memberRegisterWithPhone:(NSString *)phone password:(NSString *)password complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"phone"] = phone;
    params[@"password"] = password;
    [self requestWithMethod:POST WithPath:@"common=memberRegister" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];





}

-(void)memberLoginWithaccountnumber:(NSString *)accountnumber password:(NSString *)password complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"accountnumber"] = accountnumber;
    params[@"password"] = password;
    [self requestWithMethod:POST WithPath:@"common=memberLogin" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];


}

-(void)forgetPasswordWithPhone:(NSString *)phone password:(NSString *)password complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"phone"] = phone;
    params[@"password"] = password;
    [self requestWithMethod:POST WithPath:@"common=forgetPassword" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];

}

-(void)otherLoginWithNickname:(NSString *)nickname secretkey:(NSString *)secretkey headportrait:(NSString *)headportrait rtype:(NSString *)rtype complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"nickname"] = nickname;
    params[@"secretkey"] = secretkey;
    params[@"headportrait"] = headportrait;
    params[@"rtype"] = rtype;
    [self requestWithMethod:POST WithPath:@"common=otherLogin" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];

}

-(void)exchangePasswordWithMid:(NSString *)mid password:(NSString *)password complete:(void (^)(BaseModel *))completeBlock
{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"password"] = password;
    
    [self requestWithMethod:POST WithPath:@"common=modifyPassword" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    

}

-(void)addFeedbackWithMid:(NSString *)mid fconcent:(NSString *)fconcent fphone:(NSString *)fphone complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"type"] = @"iphone";
    params[@"fconcent"] = fconcent;
    params[@"fphone"] = fphone;
    
    [self requestWithMethod:POST WithPath:@"common=addFeedback" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
}




@end
