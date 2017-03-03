//
//  MainTabViewController.m
//  funpaw
//
//  Created by czx on 2017/2/7.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "MainTabViewController.h"
#import "LampViewController.h"
#import "VisiterViewController.h"
#import "MeViewController.h"

@interface MainTabViewController ()
@property(nonatomic,strong)UINavigationController * lampVc;
@property(nonatomic,strong)UINavigationController * visiterVc;
@property(nonatomic,strong)UINavigationController * meVc;

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

-(void)setupSubviews{
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewControllers = @[self.lampVc,self.visiterVc,self.meVc];
    
   // self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
//    self.tabBar.layer.shadowOpacity = 0.4;
//    self.tabBar.layer.shadowRadius = 2;
    self.tabBar.barTintColor =[UIColor whiteColor];
    
  


    
}
////device
//-(UINavigationController *)eggVc{
//    if (!_eggVc) {
//        EggViewController * vc = [[EggViewController alloc]init];
//        vc.tabBarItem =[[UITabBarItem alloc]initWithTitle:nil
//                                                    im    age:[[UIImage imageNamed:@"egg_device_n"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//                                                        selectedImage:[[UIImage imageNamed:@"egg_device"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        
//        
//        _eggVc = [[UINavigationController alloc]initWithRootViewController:vc];
//    }
//
//    return _eggVc;
//}
//
//-(UINavigationController *)moreVc{
//    if ((!_moreVc)) {
//        More2ViewController * vc = [[More2ViewController alloc]init];
//        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil
//                                                     image:[[UIImage imageNamed:@"egg_more@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"egg_more_s"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        
//        _moreVc =[[UINavigationController alloc]initWithRootViewController:vc];
//    }
//    
//    return _moreVc;
//}
//

-(UINavigationController *)lampVc{
    if ((!_lampVc)) {
        LampViewController * vc = [[LampViewController alloc]init];
                vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil
                                                             image:[[UIImage imageNamed:@"egg_more@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"egg_more_s"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    _lampVc = [[UINavigationController alloc]initWithRootViewController:vc];
    }

    return _lampVc;
}

-(UINavigationController *)visiterVc{
    if (!_visiterVc) {
        VisiterViewController * vc = [[VisiterViewController alloc]init];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil
                                                     image:[[UIImage imageNamed:@"egg_more@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"egg_more_s"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        _visiterVc = [[UINavigationController alloc]initWithRootViewController:vc];
    }

    

    return _visiterVc;
}

-(UINavigationController *)meVc{
    if (!_meVc) {
        MeViewController * vc = [[MeViewController alloc]init];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil
                                                     image:[[UIImage imageNamed:@"egg_more@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"egg_more_s"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        _meVc = [[UINavigationController alloc]initWithRootViewController:vc];
        
        
    }
    return _meVc;
}




-(void)pushViewController:(UIViewController *)viewController{
    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        [((UINavigationController*)self.selectedViewController) pushViewController:viewController animated:YES];
        
    }
    


}

@end
