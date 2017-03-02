//
//  ShareWork+Friend.h
//  funpaw
//
//  Created by czx on 2017/3/2.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (Friend)
//查询好友列表
-(void)queryFriendsWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel * model))completeBlock;

//搜索好友(用户)
-(void)searchPeopleWithMid:(NSString *)mid condition:(NSString *)condition page:(int)page size:(int)size complete:(void (^)(BaseModel * model))completeBlock;


//申请添加好友
-(void)addFriendRequsetWithMid:(NSString *)mid friend:(NSString *)friendid complete:(void (^)(BaseModel * model))completeBlock;

//新的朋友消息列表
-(void)newFriendsMsgWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel * model))completeBlock;

//同意/拒绝 添加好友
-(void)addFriendResponseWithMid:(NSString *)mid friend:(NSString *)friendId opttype:(NSString *)opttype complete:(void (^)(BaseModel * model))completeBlock;

//删除好友
-(void)delFriendWithMid:(NSString *)mid friend:(NSString *)friendId complete:(void (^)(BaseModel * model))completeBlock;


//新的朋友消息未读数辆
-(void)newFriendsMsgCountWithMid:(NSString *)mid complete:(void (^)(BaseModel * model))completeBlock;


//新的朋友消息读取状态修改
-(void)modifyFriendsMsgStatusWithMid:(NSString *)mid complete:(void (^)(BaseModel * model))completeBlock;

@end
