//
//  CCDefaultRawDataHandler.m
//  CCSimpleAppKit
//
//  Created by 李冰 on 2019/6/4.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCRequestDefaultHandler.h"

static NSString * const kDefaultResponseDataKey = @"data";
static NSString * const kDefaultResponseCodeKey = @"code";
static NSString * const kDefaultResponseMessageKey = @"message";

@implementation CCRequestDefaultHandler

- (BOOL)successFromRequest:(CCNetworkRequest *)request code:(NSInteger)code {
    
    if (code == 200) {
        
        return YES;
    }
    
    return NO;
}

- (id)dataContentFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[kDefaultResponseDataKey];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return nil;
}

- (NSString *)messageFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[kDefaultResponseMessageKey];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return nil;
}

- (NSInteger)statusCodeFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return [responseObject[kDefaultResponseCodeKey] integerValue];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return -1;
}

- (NSDictionary *)headerFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString {
    
    return nil;
}

- (NSDictionary *)parametersFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString parameters:(NSDictionary *)originalParameters {
    
    return originalParameters;
}

@end
