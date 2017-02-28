//
//  ShareWork+GetSipIP.m
//  funpaw
//
//  Created by yulei on 17/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+GetSipIP.h"

@implementation ShareWork (GetSipIP)

-(void)service:(NSString *)ip complete:(void(^)(BaseModel *model))completeBlock
{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [self requestWithMethod:POST WithPath:@"common=getSipServer" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
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
