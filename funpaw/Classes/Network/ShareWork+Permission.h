//
//  ShareWork+Permission.h
//  funpaw
//
//  Created by czx on 2017/3/1.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (Permission)
//查询规则
-(void)queryRuleWithMid:(NSString *)mid complete:(void (^)(BaseModel * model))completeBlock;

//规则状态修改（换成哪个规则）
-(void)ruleModifyStatusWithMid:(NSString *)mid rid:(NSString *)rid complete:(void (^)(BaseModel * model))completeBlock;

//删除规则
-(void)ruleDelWithRid:(NSString *)rid complete:(void (^)(BaseModel * model))completeBlock;

//新建规则
-(void)ruleSetWithMid:(NSString *)mid rulesname:(NSString *)rulesname object:(NSString *)object friends:(NSString *)friends tsnum:(NSString *)tsnum complete:(void (^)(BaseModel * model))completeBlock;

//修改规则
-(void)ruleModifyInfoWithMid:(NSString *)mid rulesname:(NSString *)rulesname object:(NSString *)object friends:(NSString *)friends tsnum:(NSString *)tsnum complete:(void (^)(BaseModel * model))completeBlock;

//指定好友
-(void)ruleSetQueryFriendWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel * model))completeBlock;

//指定好友rid（修改的时候）
-(void)ruleSetQueryExchangeFriendWithMid:(NSString *)mid rid:(NSString *)rid page:(int)page size:(int)size complete:(void (^)(BaseModel * model))completeBlock;


@end
