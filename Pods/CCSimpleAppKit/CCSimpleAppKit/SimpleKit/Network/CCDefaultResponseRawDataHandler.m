//
//  CCDefaultRawDataHandler.m
//  CCSimpleAppKit
//
//  Created by 李冰 on 2019/6/4.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCDefaultResponseRawDataHandler.h"

static NSString * const kDefaultResponseDataKey = @"data";
static NSString * const kDefaultResponseCodeKey = @"code";
static NSString * const kDefaultResponseMessageKey = @"message";

@implementation CCDefaultResponseRawDataHandler

- (id)dataContentWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[kDefaultResponseDataKey];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return nil;
}

- (NSInteger)statusCodeWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return [responseObject[kDefaultResponseCodeKey] integerValue];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return -1;
}

- (NSString *)messageWithHandler:(id<CCResponseRawDataHandler>)handler task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[kDefaultResponseMessageKey];
    }
    
    NSAssert(NO, @"Default response data handler can not handle, please implement CCResponseRawDataHandler delegate by your self!");
    
    return nil;
}

@end
