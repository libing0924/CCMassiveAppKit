//
//  CCSimpleRequest.h
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

// massiveKit业务层的网络请求(耦合缓存服务、json对象服务)

#import <CCSimpleAppKit/CCNetworkRequest.h>

@interface CCSimpleRequest : CCNetworkRequest

- (void)requestGET:(NSString *)urlStr
        parameters:(NSDictionary *)params
         bindModel:(Class)modelClass 
          response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

- (void)requestPOST:(NSString *)urlStr
         parameters:(NSDictionary *)params
          bindModel:(Class)modelClass
           response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

@end
