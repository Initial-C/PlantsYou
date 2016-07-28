//
//  UIBarButtonItem+navItem.h
//  BeeSi
//
//  Created by Mr.C on 16/6/15.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (navItem)

+ (instancetype)navItemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage addTarget:(id)target action:(SEL)action;

+ (instancetype)navItemWithImage:(UIImage *)image selImage:(UIImage *)selImage addTarget:(id)target action:(SEL)action;

@end
