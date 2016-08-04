//
//  PYTabBarController.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/28.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "PYTabBarController.h"
#import "PYNavigationController.h"

#import "PYPlantLifeViewController.h"
#import "PYPlantsViewController.h"
#import "PYMeViewController.h"

@interface PYTabBarController ()

@end

@implementation PYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    [self addAllChildViewController];
}

- (void)setUpTabBar {
    [self.tabBar setTranslucent:NO]; // 取消tabBar半透明
    
    self.tabBar.tintColor = ZWColor(8, 192, 176, 1.0);
}

- (void)addAllChildViewController {
    // 荟生活
    PYPlantLifeViewController *plantLiftVC = [[PYPlantLifeViewController alloc] init];
    [self setUpOneChildViewController:plantLiftVC setTitle:@"荟生活" setImage:@"info" setSelImage:@"info-selected"];
    // 植物
    PYPlantsViewController *plantsVC = [[PYPlantsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self setUpOneChildViewController:plantsVC setTitle:@"植物" setImage:@"search" setSelImage:@"search-selected"];
    // 我
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"PYMeViewController" bundle:nil];
    PYMeViewController *meVC = [sb instantiateViewControllerWithIdentifier:@"meCell"];
    [self setUpOneChildViewController:meVC setTitle:@"我" setImage:@"me" setSelImage:@"me-selected"];
    
    
}
- (void)setUpOneChildViewController:(UIViewController *)vc setTitle:(NSString *)title setImage:(NSString *)image setSelImage:(NSString *)selImage {
    
    PYNavigationController *pyNav = [[PYNavigationController alloc] initWithRootViewController:vc];
    pyNav.tabBarItem.title = title;
    pyNav.tabBarItem.image = [UIImage imageWithOriImage:image];
    pyNav.tabBarItem.selectedImage = [UIImage imageWithOriImage:selImage];
    [self addChildViewController:pyNav];
}

@end
