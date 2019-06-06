//
//  CCProjectBaseRequestHandler.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCProjectBaseRequestHandler.h"

@implementation CCProjectBaseRequestHandler

- (BOOL)successFromRequest:(CCNetworkRequest *)request code:(NSInteger)code {
    
    if (code == 200) {
        
        return YES;
    }
    
    return NO;
}

- (id)dataContentFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[@"data"];
    }
    
    return nil;
}

- (NSString *)messageFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[@"msg"];
    }
    
    return nil;
}

- (NSInteger)statusCodeFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return [responseObject[@"code"] integerValue];
    }
    
    return -1;
}

- (NSDictionary *)headerFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString {
    
    return @{@"token":@"token Adot2Ampe"};
}

- (NSDictionary *)parametersFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString parameters:(NSDictionary *)originalParameters {
    
    return originalParameters;
}

@end
