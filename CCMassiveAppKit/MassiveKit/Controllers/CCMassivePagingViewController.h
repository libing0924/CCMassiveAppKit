//
//  CCBasePagingViewController.h
//  BluetoothScale
//
//  Created by 李冰 on 2019/4/29.
//  Copyright © 2019 CC. All rights reserved.
//

// 耦合分页请求(CCPagingRequest)、分页控件（MJRefresh）
#import "CCMassiveListViewController.h"
#import <CCSimpleAppKit/CCPagingRequest.h>

@interface CCMassivePagingViewController : CCMassiveListViewController <CCPagingRequestHandler>

@property (nonatomic, strong) NSString *urlStr;

@property (nonatomic, strong) CCPagingRequest *pagingRequest;

@property (nonatomic, assign) BOOL autoBeginRequest;

// 
- (Class)ripeModel;

#pragma mark CCPagingRequestHandler
- (void)pagingRequestHasNoMoreData:(CCPagingRequest *)pagingRequest;

- (void)pagingRequestDidEnd:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel;

- (NSUInteger)pagingRequestTotalData:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel;

- (NSDictionary *)parametersWithPagingRequest:(CCPagingRequest *)pagingRequest originalParameters:(NSDictionary *)originalParameters;
@end
