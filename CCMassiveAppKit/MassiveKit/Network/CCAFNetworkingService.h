//
//  LBNetworkingManager.h
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

// massiveKit基于simpleKit的规范对AFNetworking的请求接入层的封装，和业务无关只实现单纯的网络请求

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CCSimpleAppKit/CCNetworkService.h>
#import <CCSimpleAppKit/CCSingletonService.h>

@interface CCAFNetworkingService : NSObject <CCNetworkService, CCSingletonService>

+ (CCAFNetworkingService *)sharedInstance;

@end
