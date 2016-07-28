//
//  UITextField+ZWPlaceholder.m
//  BeeSi
//
//  Created by Mr.C on 16/6/20.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "UITextField+ZWPlaceholder.h"

@implementation UITextField (ZWPlaceholder)
// 设置占位文字颜色
- (void)setPlaceholderColor:(UIColor *)color {
    
    // attributedPlaceholder
    //    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    //    attr[NSForegroundColorAttributeName] = color;
    //    self.attributedPlaceh
    // 设置占位文字颜色 => 猜测文本框占位文字是UILabel => 拿到这个label就好 => runtime(获取一个类中所有属性名) => 断点
    // 注意点:判断有没有文字,用长度
    if (self.placeholder.length == 0) {
        self.placeholder = @" ";
    }
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = color;
}
- (UIColor *)placeholderColor {
    return nil;
}
@end
