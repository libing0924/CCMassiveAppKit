//
//  CCNetworkRequestFactory.m
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/6/3.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCNetworkRequestFactory.h"

static id<CCNetworkService> networkGlobeService = nil;

@implementation CCNetworkRequestFactory

+ (id<CCNetworkService>)globeRequestService {
    
    return networkGlobeService;
}

+ (id<CCNetworkService>)dequeueReusableRequestService {
    
    return [self globeRequestService];
}

+ (void)registerGlobeRequestService:(id<CCNetworkService>)globeRequestService {
    
    networkGlobeService = globeRequestService;
}

@end
