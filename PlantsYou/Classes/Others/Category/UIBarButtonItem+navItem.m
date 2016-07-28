//
//  UIBarButtonItem+navItem.m
//  BeeSi
//
//  Created by Mr.C on 16/6/15.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "UIBarButtonItem+navItem.h"

@implementation UIBarButtonItem (navItem)

+ (instancetype)navItemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage addTarget:(id)target action:(SEL)action {
    
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setImage:image forState:UIControlStateNormal];
    [itemButton setImage:highlightImage forState:UIControlStateHighlighted];
    [itemButton sizeToFit];
    [itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIView *containView = [[UIView alloc] initWithFrame:itemButton.bounds];
    [containView addSubview:itemButton];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (instancetype)navItemWithImage:(UIImage *)image selImage:(UIImage *)selImage addTarget:(id)target action:(SEL)action {
    
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setImage:image forState:UIControlStateNormal];
    [itemButton setImage:selImage forState:UIControlStateSelected];
    [itemButton sizeToFit];
    [itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *containView = [[UIView alloc] initWithFrame:itemButton.bounds];
    
    [containView addSubview:itemButton];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

@end
