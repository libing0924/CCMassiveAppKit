//
//  CCConvenientRequest.h
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/3/25.
//  Copyright © 2019 李冰. All rights reserved.
//

// 网络请求便利工具

#import <Foundation/Foundation.h>

@protocol CCRequestDataHandler <NSObject>

@required
- (NSDictionary *)requestHandler:(id<CCRequestDataHandler>)handler urlString:(NSString *)urlString requestHeader:(NSDictionary  * _Nullable)originalHeader;

@end

/**
 业务数据分解
 1.通过全局配置分解
 2.通过对象代理方法分解
 */
@protocol CCResponseRawDataHandler <NSObject>

@optional

- (BOOL)successWithHandler:(id<CCResponseRawDataHandler>)handler code:(NSInteger)code;

- (id)dataContentWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject;

- (NSString *)messageWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject;

- (NSInteger)statusCodeWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject;

- (NSDictionary *)parametersWithPagingRequest:(id<CCResponseRawDataHandler> *)handler originalParameters:(NSDictionary *)originalParameters;

@end

@interface CCResponseMetaModel : NSObject

@property (nonatomic, strong) id rawData;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@interface CCConvenientRequest : NSObject

@property (nonatomic, strong) id<CCRequestDataHandler> requestHandler;
@property (nonatomic, strong) id<CCResponseRawDataHandler> responseHandler;

// 模型绑定
- (void)requestGET:(NSString *)urlStr
        parameters:(NSDictionary *)params
          response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

- (void)requestPOST:(NSString *)urlStr
        parameters:(NSDictionary *)params
          response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

// 缓存绑定
- (void)cacheRequest:(NSString *)urlStr;

@end
