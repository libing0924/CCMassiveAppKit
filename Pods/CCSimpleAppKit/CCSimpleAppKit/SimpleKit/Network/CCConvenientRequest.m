//
//  CCConvenientRequest.m
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/3/25.
//  Copyright © 2019 李冰. All rights reserved.
//

#import "CCConvenientRequest.h"
#import "CCNetworkRequestFactory.h"
#import "CCDefaultResponseRawDataHandler.h"

@implementation CCResponseMetaModel


@end

@implementation CCConvenientRequest

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params response:(void (^)(CCResponseMetaModel *))response {
    
    NSDictionary *header = [self _requestHeaderWithURL:urlStr originalHeader:nil];
    
    [[CCNetworkRequestFactory globeRequestService] requestGET:urlStr parameters:params headers:header success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        CCResponseMetaModel *dataModel = [self _handleResponseRawData:task responseObject:responseObject error:nil];
        response(dataModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        CCResponseMetaModel *dataModel = [self _handleResponseRawData:task responseObject:nil error:error];
        response(dataModel);
    }];
}

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params response:(void (^)(CCResponseMetaModel *))response {
    
    NSDictionary *header = [self _requestHeaderWithURL:urlStr originalHeader:nil];
    
    [[CCNetworkRequestFactory globeRequestService] requestPOST:urlStr parameters:params headers:header success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        CCResponseMetaModel *dataModel = [self _handleResponseRawData:task responseObject:responseObject error:nil];
        response(dataModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        CCResponseMetaModel *dataModel = [self _handleResponseRawData:task responseObject:nil error:error];
        response(dataModel);
    }];
}

- (void)cacheRequest:(NSString *)urlStr {
    
    
}

- (NSDictionary *)_requestHeaderWithURL:(NSString *)urlString originalHeader:(NSDictionary *)originalHeader {
    
    NSDictionary *destinationHeader = nil;
    if (_requestHandler && [_requestHandler respondsToSelector:@selector(requestHandler:urlString:requestHeader:)]) {
        
        NSDictionary *header = [_requestHandler requestHandler:_requestHandler urlString:urlString requestHeader:originalHeader];
        
        if ([header isKindOfClass:NSDictionary.class]) {
            
            destinationHeader = header.copy;
        }
    }
    
    return destinationHeader;
}


- (CCResponseMetaModel *)_handleResponseRawData:(NSURLSessionDataTask * _Nullable)task responseObject:(id)responseObject error:(NSError *)error {
    
    CCResponseMetaModel *model = [CCResponseMetaModel new];
    
    if (!_responseHandler) {
     
        _responseHandler = [[CCDefaultResponseRawDataHandler alloc] init];
    }
    
    id data = nil;
    NSInteger code = -1;
    NSString *message = nil;
    if (!error && responseObject) {
        
        data = [_responseHandler dataContentWithHandler:_responseHandler task:task responseObject:responseObject];
        code = [_responseHandler statusCodeWithHandler:_responseHandler task:task responseObject:responseObject];
        message = [_responseHandler messageWithHandler:_responseHandler task:task responseObject:responseObject];
    } else {
        
        code = error.code;
        message = error.description;
    }
    
    BOOL success = [_responseHandler successWithHandler:_responseHandler code:code];
    model.success = !error && success;
    model.rawData = data;
    model.code = code;
    model.message = message;
    
    return model;
}

@end
