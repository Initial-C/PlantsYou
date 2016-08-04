//
//  PYPlantLifeViewController.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/28.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "PYPlantLifeViewController.h"
#import <AFNetworking/AFNetworking.h>

#define baseUrl @"http://a.penyou.cc/penyou/api"

@interface PYPlantLifeViewController ()


@property (strong, nonatomic) AFHTTPSessionManager *mgr;

@end

@implementation PYPlantLifeViewController
- (AFHTTPSessionManager *)mgr {
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"荟生活";
//    [self loadData];
}

- (void)loadData {

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSMutableDictionary *requestDict = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    NSMutableDictionary *totalDict = [NSMutableDictionary dictionary];
    requestDict[@"version"] = @"v3";
    requestDict[@"method"] = @"articles";
    
    paramsDict[@"id"] = @"1111111111112";
    paramsDict[@"since"] = @"";
    paramsDict[@"until"] = @"";
    
    totalDict[@"request"] = requestDict;
    totalDict[@"params"] = paramsDict;
    // 将json传递的参数转为字符串
    NSString *parameter = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:totalDict options:0 error:nil] encoding:NSUTF8StringEncoding];
    parameters[@"query"] = parameter;
    NSLog(@"%@", parameters);
    [self.mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
//        [responseObject writeToFile:@"/Users/Mr.C/Desktop/essence.json" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
