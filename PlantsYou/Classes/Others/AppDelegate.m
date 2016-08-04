//
//  AppDelegate.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/25.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "AppDelegate.h"
#import "PYTabBarController.h"
#import <QuartzCore/QuartzCore.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 添加启动风景
    PYTabBarController *tabV = [[PYTabBarController alloc] init];
    self.window.rootViewController = tabV;
    [self.window makeKeyAndVisible];
//    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置启动动画淡入淡出放大
    UIImageView *showGreenView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    showGreenView.contentMode = UIViewContentModeScaleAspectFill;
    NSString *greenImagePath = [[NSBundle mainBundle]pathForResource:@"launch.png" ofType:nil];
    showGreenView.image = [UIImage imageWithContentsOfFile:greenImagePath];
        // 放最顶层
    [self.window addSubview:showGreenView];
//    [self.window bringSubviewToFront:showGreenView];
        // 开始设置动画
            // 方案1
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:10.0];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
//    [UIView setAnimationDelegate:self];
//    showGreenView.alpha = 0.0;
//    showGreenView.frame = CGRectMake(0, 0, 500, 900);
//    [UIView commitAnimations]; // 提交动画
            // 方案2
    [UIView animateWithDuration:2.0 delay:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        showGreenView.alpha = 0.0;
        showGreenView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0);
    } completion:^(BOOL finished) {
        [showGreenView removeFromSuperview];
    }];
        // 方案3
//    [UIView animateWithDuration:2.0 animations:^{
//        showGreenView.alpha = 0.0;
//        showGreenView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0);
//    } completion:^(BOOL finished) {
//        [showGreenView removeFromSuperview];
//    }];
  
    return YES;
}



@end
