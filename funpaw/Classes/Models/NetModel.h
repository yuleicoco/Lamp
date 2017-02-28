//
//  NetModel.h
//  funpaw
//
//  Created by yulei on 17/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import <MojoDatabase/MojoDatabase.h>

@interface NetModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *area;

@property (nonatomic, copy) NSString<Optional> *area_id;

@property (nonatomic, copy) NSString<Optional> *city;

@property (nonatomic, copy) NSString<Optional> *city_id;

@property (nonatomic, copy) NSString<Optional> *country;

@property (nonatomic, copy) NSString<Optional> * country_id;

@property (nonatomic, copy) NSString<Optional> *county;

@property (nonatomic, copy) NSString<Optional> *county_id;

@property (nonatomic, copy) NSString<Optional> *ip;

@property (nonatomic, copy) NSString<Optional> *isp;

@property (nonatomic, copy) NSString<Optional> *isp_id;

@property (nonatomic, copy) NSString<Optional> *region;

@property (nonatomic, copy) NSString<Optional> *region_id;

@end
