//
//  ShareWork+PersonMember.m
//  funpaw
//
//  Created by czx on 2017/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+PersonMember.h"

@implementation ShareWork (PersonMember)
-(void)modifyMemberWithMid:(NSString *)mid nickname:(NSString *)nickname complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"nickname"] = nickname;
    [self requestWithMethod:POST WithPath:@"common=modifyMember" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        if (model) {
            // NSLog(@"哈哈");
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
}

-(void)modifyHeadportraitWithMid:(NSString *)mid picture:(NSString *)picture complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"picture"] =picture;
    [self requestWithMethod:POST WithPath:@"common=modifyHeadportrait" WithParams:params WithSuccessBlock:^(BaseModel *model) {
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
