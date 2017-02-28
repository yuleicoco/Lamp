//
//  NetWork.h
//  funpaw
//
//  Created by yulei on 17/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import <MojoDatabase/MojoDatabase.h>

@interface NetWork : JSONModel
@property (nonatomic, copy) NSDictionary<Optional> *data;

@property (nonatomic, copy) NSString<Optional> *code;


@end
