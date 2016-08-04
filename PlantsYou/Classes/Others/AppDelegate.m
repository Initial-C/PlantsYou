//
//  AppDelegate.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/25.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "AppDelegate.h"
#import "PYTabBarController.h"
#import "PYLoadNetLaunchImage.h"
#import <QuartzCore/QuartzCore.h>

#define launchImageURL @"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"
@interface AppDelegate ()

@property (strong, nonatomic) NSMutableDictionary *images;

@end

@implementation AppDelegate

- (NSMutableDictionary *)images {
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    PYTabBarController *tabV = [[PYTabBarController alloc] init];
    self.window.rootViewController = tabV;
    [self.window makeKeyAndVisible];
//    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置启动动画淡入淡出放大
    UIImageView *showGreenView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    showGreenView.contentMode = UIViewContentModeScaleAspectFill;
    
#pragma mark - 下载启动图片
    NSString *fileName = [launchImageURL lastPathComponent];
    // 到内存中找
    UIImage *launchImage = [self.images objectForKey:fileName];
    if (launchImage) {
        showGreenView.image = launchImage;
    }else {
        // 就到磁盘上找
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        NSString *fileFull = [caches stringByAppendingPathComponent:fileName]; //拼接全路径
        NSData *imageData = [NSData dataWithContentsOfFile:fileFull];
        if (imageData) {
            UIImage *launchImage = [UIImage imageWithData:imageData];
            showGreenView.image = launchImage;
            NSLog(@"使用了磁盘缓存");
            // 1. 先保存到内存中
            [self.images setObject:launchImage forKey:fileName];
            
        }else {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:launchImageURL]]) {
                NSOperationQueue *queue = [[NSOperationQueue alloc] init];
                // 封装操作
                NSBlockOperation *downLoad = [NSBlockOperation blockOperationWithBlock:^{
                    NSURL *url = [NSURL URLWithString:launchImageURL];
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *launchImage = [UIImage imageWithData:imageData];
                    
                    // 1. 先保存到内存中
                    [self.images setObject:launchImage forKey:fileName];
                    // 2. 然后保存到磁盘中
                    [imageData writeToFile:fileFull atomically:YES];
                    NSLog(@"从网络下载启动图");
                    // 获得主队列
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        showGreenView.image = launchImage;     // *************#############@@@@@@@@@@@@
//                        NSLog(@"UI---downLoad---%@", [NSThread currentThread]);
                    }];
                }];
                
                [queue addOperation:downLoad];
            } else {
                
                NSString *greenImagePath = [[NSBundle mainBundle]pathForResource:@"launch.png" ofType:nil];
                showGreenView.image = [UIImage imageWithContentsOfFile:greenImagePath];
            }
            
        }
        
    }
#pragma mark - 启动动画方案
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
