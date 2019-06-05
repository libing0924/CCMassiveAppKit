//
//  CCSimpleAppKitModule.h
//  CCSimpleAppKit
//
//  Created by 李冰 on 2019/6/4.
//  Copyright © 2019 CC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCMassiveKitModule : NSObject

// 需提供可配置下面handler的全局函数
// CCResponseRawDataHandler
// CCRequestDataHandler
// CCPagingRawDataHandler
+ (void)configNetworkGlobeHandler;

// 配置Simple app kit的massive kit配置
+ (void)configMassiveKit;

@end
