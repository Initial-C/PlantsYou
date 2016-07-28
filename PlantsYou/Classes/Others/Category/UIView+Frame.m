//
//  UIView+Frame.m
//  小码哥彩票
//
//  Created by xiaomage on 16/5/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
//加属性第一种方法,写@dynamic自动生成get,set方法
//@dynamic x;
//@dynamic y;
//@dynamic width;
//@dynamic heigth;
//centerX属性的get,set
- (void)setZw_centerX:(CGFloat)zw_centerX
{
    CGPoint center = self.center;
    center.x = zw_centerX;
    self.center = center;
}
- (CGFloat)zw_centerX
{
    return self.center.x;
}
//centerY属性的get,set
- (void)setZw_centerY:(CGFloat)zw_centerY
{
    CGPoint center = self.center;
    center.y = zw_centerY;
    self.center = center;
}
- (CGFloat)zw_centerY
{
    return self.center.y;
}

- (void)setZw_x:(CGFloat)zw_x {
    CGRect frame = self.frame;
    frame.origin.x = zw_x;
    self.frame = frame;
}
- (CGFloat)zw_x {
    return self.frame.origin.x;
}

- (void)setZw_y:(CGFloat)zw_y {
    CGRect frame = self.frame;
    frame.origin.y = zw_y;
    self.frame = frame;
}
- (CGFloat)zw_y {
    return self.frame.origin.y;
}

-(void)setZw_width:(CGFloat)zw_width {
    CGRect frame = self.frame;
    frame.size.width = zw_width;
    self.frame = frame;
}
- (CGFloat)zw_width {
    return self.frame.size.width;
}

- (void)setZw_height:(CGFloat)zw_height {
    CGRect frame = self.frame;
    frame.size.height = zw_height;
    self.frame = frame;
}
- (CGFloat)zw_height {
    return self.frame.size.height;
}

- (void)setZw_origin:(CGPoint)zw_origin
{
    CGRect frame = self.frame;
    frame.origin = zw_origin;
    self.frame = frame;
}
- (CGPoint)zw_origin
{
    return self.frame.origin;
}

- (void)setZw_size:(CGSize)zw_size
{
    CGRect frame = self.frame;
    frame.size = zw_size;
    self.frame = frame;
}

- (CGSize)zw_size
{
    return self.frame.size;
}
@end
