//
//  ShareWork+PersonMember.h
//  funpaw
//
//  Created by czx on 2017/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (PersonMember)
//修改会员基本信息
-(void)modifyMemberWithMid:(NSString *)mid nickname:(NSString *)nickname complete:(void(^)(BaseModel *model))completeBlock;

//修改头像
-(void)modifyHeadportraitWithMid:(NSString *)mid
                         picture:(NSString *)picture
                        complete:(void(^)(BaseModel *model))completeBlock;



@end
