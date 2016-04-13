//
//  ZXTabBarController.m
//  PartyMaster
//
//  Created by zhaoxu on 16/4/5.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "ZXTabBarController.h"
#import "ZXNavigationViewController.h"
#import "ViewController.h"

@interface ZXTabBarController ()

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"首页",@"消息",@"我的"];
    NSArray *imageArray = @[@"首页灰",@"消息灰",@"我的灰色"];
    NSArray *imageSelArray = @[@"首页紫色",@"消息",@"我的"];
    
    NSArray *vcArray = @[@"ViewController",@"ViewController",@"ViewController"];
    
    NSMutableArray *controllers=[NSMutableArray array];
    
    for (int i = 1; i <= titleArray.count; i++) {
        UIImage *Image = [UIImage imageNamed:imageArray[i-1]];
        UIImage *ImageSel = [UIImage imageNamed:imageSelArray[i-1]];
        Image = [Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ImageSel = [ImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *className = vcArray[i-1];//类名
        Class class=NSClassFromString(className);
        UIViewController *vc=[[class alloc]init];
        ZXNavigationViewController *nacVC = [[ZXNavigationViewController alloc]initWithRootViewController:vc];
        self.tabBar.tintColor = [UIColor blackColor];
        nacVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArray[i-1] image:Image selectedImage:ImageSel];
        nacVC.tabBarItem.tag = i;
        [nacVC setNeedsStatusBarAppearanceUpdate];
        [controllers addObject:nacVC];
    }
    
    self.viewControllers = controllers;
    self.tabBar.translucent=NO;//不透明效果
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
