//
//  ShareWork+GetSipIP.h
//  funpaw
//
//  Created by yulei on 17/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (GetSipIP)

// 获取sip
-(void)service:(NSString *)ip complete:(void(^)(BaseModel *model))completeBlock;

@end
