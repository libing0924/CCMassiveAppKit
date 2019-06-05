//
//  LBNetworkingManager.h
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

// HTTP请求的封装层

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CCNetworkService.h>

@interface CCAFNetworkingService : NSObject <CCNetworkService>

+ (CCAFNetworkingService *)sharedInstance;

- (void)configBaseUrlString:(NSString *)urlString;

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params headers:(NSDictionary *)headers success:(cc_net_success_block)success failure:(cc_net_failure_block)failure;

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params headers:(NSDictionary *)headers success:(cc_net_success_block)success failure:(cc_net_failure_block)failure;

@end
