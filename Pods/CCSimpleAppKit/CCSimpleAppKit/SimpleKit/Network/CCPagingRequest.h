//
//  CCPagingRequestControl.h
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/3/25.
//  Copyright © 2019 李冰. All rights reserved.
//

// 采用装饰者模式
#import <Foundation/Foundation.h>
#import "CCConvenientRequest.h"
//#import <MJRefreshHeader.h>
//#import <MJRefreshFooter.h>

@class CCPagingRequest;

FOUNDATION_EXPORT NSString * const kDefaultPagingRequestPageNumKey;
FOUNDATION_EXPORT NSString * const kDefaultPagingRequestPageSizeKey;

typedef NS_ENUM(NSInteger, CCPagingRequestType) {
    
    CCPagingRequestTypeGET = 1,
    CCPagingRequestTypePOST = 2,
};

@protocol CCPagingRawDataHandler <NSObject>

@optional
- (NSDictionary *)parametersWithPagingRequest:(CCPagingRequest *)pagingRequest originalParameters:(NSDictionary *)originalParameters;

- (void)pagingRequestDidEnd:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel;

- (void)pagingRequestHasNoMoreData:(CCPagingRequest *)pagingRequest;

@end

@interface CCPagingRequest : CCConvenientRequest

@property (nonatomic, strong) NSString *urlStr;

@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageNumber;
// default pageSize
@property (nonatomic, strong) NSString *pageSizeKey;
// default pageNum
@property (nonatomic, strong) NSString *pageNumberKey;
// default GET
@property (nonatomic, assign) CCPagingRequestType requestType;

/**
 data source
 */
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, weak) id<CCPagingRawDataHandler> pageingHandler;

- (void)firstPageRequest;
- (void)nextPageRequest;

@end
