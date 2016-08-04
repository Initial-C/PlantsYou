//
//  UIImage+Image.m
//  
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "UIImage+Image.h"

//static const NSMutableDictionary *images = nil;
@implementation UIImage (Image)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
+ (UIImage *)imageWithOriImage:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//+ (UIImage *)imageWithLaunchImageFromNet:(NSString *)launchImageURL {
//    NSString *fileName = [launchImageURL lastPathComponent];
//    UIImage *launchImage = [images objectForKey:fileName];
//    if (launchImage) {
//        return launchImage;
//    }else {
//        // 就到磁盘上找
//        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
//        NSString *fileFull = [caches stringByAppendingPathComponent:fileName]; //拼接全路径
//        NSData *imageData = [NSData dataWithContentsOfFile:fileFull];
//        if (imageData) {
//            UIImage *launchImage = [UIImage imageWithData:imageData];
//            NSLog(@"使用了磁盘缓存");
//            // 1. 先保存到内存中
//            [images setObject:launchImage forKey:fileName];
//            return launchImage;
//        }else {
//            // 新的问题: 图片不显示 由于没有刷新
//            // 创建非主队列
//            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//            // 封装操作
//            NSBlockOperation *downLoad = [NSBlockOperation blockOperationWithBlock:^{
//                NSURL *url = [NSURL URLWithString:launchImageURL];
//                NSData *imageData = [NSData dataWithContentsOfURL:url];
//                UIImage *launchImage = [UIImage imageWithData:imageData];
//                
//                // 1. 先保存到内存中
//                [images setObject:launchImage forKey:fileName];
//                // 2. 然后保存到磁盘中
//                [imageData writeToFile:fileFull atomically:YES];
//                NSLog(@"下载了启动图片");
//                // 获得主队列
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    
//                    launchImage;          // *************#############@@@@@@@@@@@@
//                    NSLog(@"UI---downLoad---%@", [NSThread currentThread]);
//                }];
//                
//            }];
//
//            [queue addOperation:downLoad];
//            
//            
//        }
//        
//    }
//}




@end
