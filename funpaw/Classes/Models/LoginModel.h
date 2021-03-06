//
//  LoginModel.h
//  petegg
//
//  Created by czx on 16/4/5.
//  Copyright © 2016年 sego. All rights reserved.
//

#import <MojoDatabase/MojoDatabase.h>
#import "JSONModel.h"


@interface LoginModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *accountnumber;

@property (nonatomic, copy) NSString<Optional> *createtime;

@property (nonatomic, copy) NSString<Optional> *deviceno;

@property (nonatomic, copy) NSString<Optional> *dwid;

@property (nonatomic, copy) NSString<Optional> * friends;

@property (nonatomic, copy) NSString<Optional> *headportrait;

@property (nonatomic, copy) NSString<Optional> *isfriend;

@property (nonatomic, copy) NSString<Optional> * isset;

@property (nonatomic, copy) NSString<Optional> *mid;

@property (nonatomic, copy) NSString<Optional> *nickname;

@property (nonatomic, copy) NSString<Optional> *openvideo;

@property (nonatomic, copy) NSString<Optional> *opttime;

@property (nonatomic, copy) NSString<Optional> *otheraccount;

@property (nonatomic, copy) NSString<Optional> *password;

@property (nonatomic ,copy) NSString<Optional> * phone;

@property (nonatomic, copy) NSString<Optional> * resolution;

@property (nonatomic, copy) NSString<Optional> * rtype;

@property (nonatomic, copy) NSString<Optional> * ruletype;

@property (nonatomic, copy) NSString<Optional> * secretkey;

@property (nonatomic, copy) NSString<Optional> * sipno;

@property (nonatomic, copy) NSString<Optional> * sippw;

@property (nonatomic, copy) NSString<Optional> * status;

@property (nonatomic, copy) NSString<Optional> * termid;

@property (nonatomic, copy) NSString<Optional> * type;
@end
