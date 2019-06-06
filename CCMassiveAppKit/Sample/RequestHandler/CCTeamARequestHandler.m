//
//  CCTeamARequestHandler.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCTeamARequestHandler.h"

@implementation CCTeamARequestHandler

- (BOOL)successFromRequest:(CCNetworkRequest *)request code:(NSInteger)code {
    
    if (code == 0) {
        
        return YES;
    }
    
    return NO;
}

- (NSString *)messageFromRequest:(CCNetworkRequest *)request task:(NSURLSessionTask *)task responseObject:(id)responseObject {
    
    if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        return responseObject[@"message"];
    }
    
    return nil;
}

- (NSDictionary *)headerFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString {
    
    if ([urlString containsString:@"test"]) {
        
        return @{@"token":@"token Adot2Ampe", @"test":@(1)};
    }
    
    return @{@"token":@"token Adot2Ampe"};
}

@end
