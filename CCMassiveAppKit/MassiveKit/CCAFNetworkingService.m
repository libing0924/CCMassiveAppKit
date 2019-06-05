//
//  LBNetworkingManager.m
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

#import "CCAFNetworkingService.h"
#import "AFNetworking/AFNetworking/AFNetworking.h"

@interface CCAFNetworkingService ()

@property (nonatomic, strong) AFHTTPSessionManager *httpManager;

@end

@implementation CCAFNetworkingService

+ (CCAFNetworkingService *)sharedInstance {
    
    static CCAFNetworkingService *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[CCAFNetworkingService alloc] init];
    });
    
    return manager;
}

- (void)requestGET:(NSString *)urlStr
        parameters:(NSDictionary *)params
           headers:(NSDictionary *)headers
           success:(cc_net_success_block)success
           failure:(cc_net_failure_block)failure {
        
    for (NSString *key in headers.allKeys) {
        
        [self.httpManager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
    
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [self.httpManager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !success ?: success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ?: failure(task, error);
    }];
}

- (void)requestPOST:(NSString *)urlStr
         parameters:(NSDictionary *)params
            headers:(NSDictionary *)headers
            success:(cc_net_success_block)success
            failure:(cc_net_failure_block)failure {
    
    for (NSString *key in headers.allKeys) {
            
        [self.httpManager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
    
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [self.httpManager POST:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !success ?: success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? : failure(task, error);
    }];
}

@end
