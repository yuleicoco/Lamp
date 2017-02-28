//
//  LampViewController.m
//  funpaw
//
//  Created by czx on 2017/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "LampViewController.h"
#import "ShareWork.h"
#import "NetWork.h"
#import "NetModel.h"



@interface LampViewController ()

@end

@implementation LampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
     [[ShareWork sharedManager]requestNetWorkWithSuccessBlock:^(NetWork *model) {
         
       //  NetModel * net =[[NetModel alloc]initWithDictionary:model.data error:nil];
      

     } WithFailurBlock:^(NSError *error) {
         
     }];
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
