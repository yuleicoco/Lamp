//
//  ShareWork+Permission.m
//  funpaw
//
//  Created by czx on 2017/3/1.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+Permission.h"
#import "RuleModel.h"
#import "ZdFriendModel.h"

@implementation ShareWork (Permission)
-(void)queryRuleWithMid:(NSString *)mid complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    [self requestWithMethod:POST WithPath:@"common=queryRule" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        if (model) {
             model.list = [RuleModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];

    
    
    
    
}

//
-(void)ruleModifyStatusWithMid:(NSString *)mid rid:(NSString *)rid complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"rid"] = rid;
    [self requestWithMethod:POST WithPath:@"common=ruleModifyStatus" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
}
//
-(void)ruleDelWithRid:(NSString *)rid complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"rid"] = rid;
    [self requestWithMethod:POST WithPath:@"common=ruleDel" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
}
//
-(void)ruleSetWithMid:(NSString *)mid rulesname:(NSString *)rulesname object:(NSString *)object friends:(NSString *)friends tsnum:(NSString *)tsnum complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"rulesname"] = rulesname;
    params[@"object"] = object;
    params[@"friends"] = friends;
   // params[@"tsnum"] = tsnum;
    [self requestWithMethod:POST WithPath:@"common=ruleSet" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
}

-(void)ruleModifyInfoWithMid:(NSString *)mid rulesname:(NSString *)rulesname object:(NSString *)object friends:(NSString *)friends tsnum:(NSString *)tsnum complete:(void (^)(BaseModel *))completeBlock{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"rid"] = mid;
    params[@"rulesname"] = rulesname;
    params[@"object"] = object;
    params[@"friends"] = friends;
   // params[@"tsnum"] = tsnum;
    [self requestWithMethod:POST WithPath:@"common=ruleModifyInfo" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
    
}


-(void)ruleSetQueryFriendWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[ NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"page"] = @(page);
    params[@"size"] = @(size);
    
    [self requestWithMethod:POST WithPath:@"common=ruleSetQueryFriend" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            model.list = [ZdFriendModel arrayOfModelsFromDictionaries:model.list];

        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
}

-(void)ruleSetQueryExchangeFriendWithMid:(NSString *)mid rid:(NSString *)rid page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[ NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"rid"] = rid;
    params[@"page"] = @(page);
    params[@"size"] = @(size);
    [self requestWithMethod:POST WithPath:@"common=ruleSetQueryFriend" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            model.list = [ZdFriendModel arrayOfModelsFromDictionaries:model.list];
            
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
}

@end
