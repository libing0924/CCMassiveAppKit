//
//  CCSimpleAppKitModule.m
//  CCSimpleAppKit
//
//  Created by 李冰 on 2019/6/4.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCMassiveKitModule.h"

// 基于AFNetworking框架的网络服务
#import "CCAFNetworkingService.h"
// request代理
#import "CCRequestDefaultHandler.h"
// paging request代理
#import "CCPagingRequestDefaultHandler.h"

// SimpleAppKit
#import <CCSimpleAppKit/CCNetworkFactory.h>

@implementation CCMassiveKitModule

+ (void)configNetwork {
    
    [CCNetworkFactory registerGlobeRequestService:CCAFNetworkingService.class];
    [CCNetworkFactory registerGlobeRequestHandler:CCRequestDefaultHandler.class];
    [CCNetworkFactory registerGlobePagingRequestHandler:CCPagingRequestDefaultHandler.class];
}

+ (void)configMassiveKit {
    
}
@end
