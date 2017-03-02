//
//  ShareWork+Friend.m
//  funpaw
//
//  Created by czx on 2017/3/2.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork+Friend.h"
#import "FriendModel.h"
#import "NewFriendModel.h"

@implementation ShareWork (Friend)
-(void)queryFriendsWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"page"] = @(page);
    params[@"size"] = @(size);
    [self requestWithMethod:POST WithPath:@"common=queryFriends" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
            model.list = [FriendModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
}

-(void)searchPeopleWithMid:(NSString *)mid condition:(NSString *)condition page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"condition"] = condition;
    params[@"page"] = @(page);
    params[@"size"] = @(size);
    [self requestWithMethod:POST WithPath:@"common=searchPeople" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            // NSLog(@"哈哈");
            model.list = [FriendModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
}

-(void)addFriendRequsetWithMid:(NSString *)mid friend:(NSString *)friendid complete:(void (^)(BaseModel *))completeBlock
{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"friend"] = friendid;
    [self requestWithMethod:POST WithPath:@"common=addFriendRequest" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
}

-(void)newFriendsMsgWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"page"] = @(page);
    params[@"size"] = @(size);

    [self requestWithMethod:POST WithPath:@"common=newFriendsMsg" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            model.list = [NewFriendModel arrayOfModelsFromDictionaries:model.list];
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
}

-(void)addFriendResponseWithMid:(NSString *)mid friend:(NSString *)friendId opttype:(NSString *)opttype complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"friend"] = friendId;
    params[@"opttype"] = opttype;
    [self requestWithMethod:POST WithPath:@"common=addFriendResponse" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
           
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
}

-(void)delFriendWithMid:(NSString *)mid friend:(NSString *)friendId complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    params[@"friend"] = friendId;
    [self requestWithMethod:POST WithPath:@"common=delFriend" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];

    
}

-(void)newFriendsMsgCountWithMid:(NSString *)mid complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    [self requestWithMethod:POST WithPath:@"common=newFriendsMsgCount" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];

    
}

-(void)modifyFriendsMsgStatusWithMid:(NSString *)mid complete:(void (^)(BaseModel *))completeBlock{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"mid"] = mid;
    [self requestWithMethod:POST WithPath:@"common=modifyFriendsMsgStatus" WithParams:params WithSuccessBlock:^(BaseModel *model) {
        
        if (model) {
            
        }
        if (completeBlock) {
            completeBlock(model);
        }
        
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
    
}















@end
