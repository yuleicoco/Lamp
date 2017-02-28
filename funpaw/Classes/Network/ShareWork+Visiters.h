//
//  ShareWork+Visiters.h
//  funpaw
//
//  Created by czx on 2017/2/28.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "ShareWork.h"

@interface ShareWork (Visiters)
-(void)icanvisitWithMid:(NSString *)mid page:(int)page size:(int)size complete:(void(^)(BaseModel *model))completeBlock;

@end
