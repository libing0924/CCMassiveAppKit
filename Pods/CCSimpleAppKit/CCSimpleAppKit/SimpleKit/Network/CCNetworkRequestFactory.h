//
//  CCNetworkRequestFactory.h
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/6/3.
//  Copyright © 2019 CC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNetworkService.h"

/**
 网络请求工厂
 通过工厂创建网络请求实体类
 **使用前请务必通过registerGlobeRequestService:注册网络服务的实体类**
 */
@interface CCNetworkRequestFactory : NSObject

/**
 获取全局单例的网络服务实体对象
 
 @return 实体对象
 */
+ (id<CCNetworkService>)globeRequestService;

/**
 获取网络服务实体对象
 
 @return 实体对象
 */
+ (id<CCNetworkService>)dequeueReusableRequestService;

/**
 注册全局单例的网络服务（MassiveAppKit中自动注册）
 */
+ (void)registerGlobeRequestService:(id<CCNetworkService>)globeRequestService;

@end

