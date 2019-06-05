//
//  CCBasePagingViewController.h
//  BluetoothScale
//
//  Created by 李冰 on 2019/4/29.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCBaseListViewController.h"
#import <CCPagingRequest.h>

@interface CCBasePagingViewController : CCBaseListViewController <CCPagingRawDataHandler>

@property (nonatomic, strong) NSString *urlStr;

@property (nonatomic, strong) CCPagingRequest *pagingRequest;

@property (nonatomic, assign) BOOL autoBeginRequest;

// 下面的方法子类可继承实现，自己配置相关参数
// Covert to data model
- (Class)needRipeModel;
// Request parameters
- (NSDictionary *)requestParametersWithOriginalPatameters:(NSDictionary *)riginalPatameters;

@end
