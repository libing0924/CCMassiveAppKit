//
//  CCPagingRequestDefaultHandler.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCPagingRequestDefaultHandler.h"

@implementation CCPagingRequestDefaultHandler

- (void)pagingRequestHasNoMoreData:(CCPagingRequest *)pagingRequest {
    
    
}

- (void)pagingRequestDidEnd:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel {
    
    
}

- (NSUInteger)pagingRequestTotalData:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel {
    
    return 0;
}

- (NSDictionary *)parametersWithPagingRequest:(CCPagingRequest *)pagingRequest originalParameters:(NSDictionary *)originalParameters {
    
    return originalParameters;
}

@end
