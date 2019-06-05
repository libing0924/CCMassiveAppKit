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

// SimpleAppKit
#import "CCNetworkRequestFactory.h"

@implementation CCMassiveKitModule

// 自动加载配置
+ (void)load {
    
    [CCNetworkRequestFactory registerGlobeRequestService:[CCAFNetworkingService sharedInstance]];
}

+ (void)configNetworkGlobeHandler {
    
}

+ (void)configMassiveKit {
    
}
@end
