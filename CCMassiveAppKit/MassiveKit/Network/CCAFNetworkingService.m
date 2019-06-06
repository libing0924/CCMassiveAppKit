//
//  LBNetworkingManager.m
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

#import "CCAFNetworkingService.h"
#import <AFNetworking/AFNetworking.h>

@interface CCAFNetworkingService ()

@property (nonatomic, strong) AFHTTPSessionManager *httpManager;

@property (nonatomic, strong) NSString *baseUrl;

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

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params headers:(NSDictionary *)headers success:(cc_net_success_block)success failure:(cc_net_failure_block)failure {
    
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

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params headers:(NSDictionary *)headers success:(cc_net_success_block)success failure:(cc_net_failure_block)failure {
    
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

- (void)uploadImageWithOperations:(NSDictionary *)operations image:(UIImage *)image urlString:(NSString *)urlString progress:(cc_net_progress_block)progress success:(cc_net_success_block)success failure:(cc_net_failure_block)failure {
    
    [self.httpManager POST:urlString parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *data = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:data name:@"file" fileName:@"image.png" mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) progress(uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task, error);
    }];
}

- (void)configBaseUrlString:(NSString *)urlString {
    
    _baseUrl = urlString;
}

#pragma mark - getter
- (AFHTTPSessionManager *)httpManager {
    
    if (!_httpManager) {
        
        _httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseUrl]];
        _httpManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _httpManager.requestSerializer.timeoutInterval = 20.f;
        _httpManager.requestSerializer.cachePolicy = NSURLRequestReloadRevalidatingCacheData;
        //        [_httpManager setSecurityPolicy:[self _customSecurityPolicy]];
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        //        NSMutableIndexSet *set = [[NSMutableIndexSet alloc] initWithIndex:400];
        //        [set addIndexesInRange:NSMakeRange(400, 199)];
        //        [set addIndexesInRange:NSMakeRange(200, 100)];
        //        response.acceptableStatusCodes = set;
        response.removesKeysWithNullValues = YES;
        _httpManager.responseSerializer = response;
        NSSet *types = [NSSet setWithObjects:@"application/json",
                        @"text/plain",
                        @"text/html",
                        @"text/json",
                        @"text/javascript",
                        @"text/xml",
                        nil];
        _httpManager.responseSerializer.acceptableContentTypes = types;
    }
    return _httpManager;
}

@end
