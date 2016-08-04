//
//  PYNavigationController.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/28.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "PYNavigationController.h"

@interface PYNavigationController ()

@end

@implementation PYNavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [bar setTitleTextAttributes:attributes];
//    UIImage *navBgImage = [UIImage imageNamed:@"barbg"];
//    [navBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)]  // 已经不需要让导航条图片拉伸了
    
    bar.tintColor = [UIColor whiteColor];
    [bar setBackgroundImage:[UIImage imageNamed:@"barbg"] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
