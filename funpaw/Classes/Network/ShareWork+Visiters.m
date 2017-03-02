//
//  ShareWork+Visiters.m
//  funpaw
//
//  Created by czx on 2017/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+Visiters.h"
#import "VisiterModel.h"
@implementation ShareWork (Visiters)
-(void)icanvisitWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"page"] = @(page);
    params[@"size"] = @(size);
    
    [self requestWithMethod:POST WithPath:@"common=iCanVisit" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            model.list = [VisiterModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    





}

// 查询会员当前启用权限
-(void)OtherMid:(NSString *)mid  complete:(void (^)(BaseModel *))completeBlock
{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"friend"] = mid;
  
    [self requestWithMethod:POST WithPath:@"common=queryByRule" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            model.list = [VisiterModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    

    
}


@end
