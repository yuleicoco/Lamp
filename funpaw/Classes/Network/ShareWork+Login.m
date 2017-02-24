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
    
    [self requestWithMethod:POST WithPath:@"common=chech" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
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









@end