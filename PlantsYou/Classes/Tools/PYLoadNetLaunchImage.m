//
//  PYLoadNetLaunchImage.m
//  PlantsYou
//
//  Created by Mr.C on 16/8/4.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "PYLoadNetLaunchImage.h"

//#define launchImageURL @"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"
@interface PYLoadNetLaunchImage()

@property (strong, nonatomic) NSMutableDictionary *images;

@end

@implementation PYLoadNetLaunchImage

- (NSMutableDictionary *)images {
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}




@end
