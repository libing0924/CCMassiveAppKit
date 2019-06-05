//
//  CCPagingRequestControl.m
//  CCProjectTemplate
//
//  Created by 李冰 on 2019/3/25.
//  Copyright © 2019 李冰. All rights reserved.
//

#import "CCPagingRequest.h"

NSString * const kDefaultPagingRequestPageNumKey = @"pageNum";
NSString * const kDefaultPagingRequestPageSizeKey = @"pageSize";

@implementation CCPagingRequest

- (instancetype)init {
    
    if (self = [super init]) {
        
        _pageNumber = 1;
        _pageSize = 10;
        _requestType = CCPagingRequestTypeGET;
    }
    
    return self;
}

- (void)firstPageRequest {
    
    _pageNumber = 1;
    [self requestGET];
}

- (void)nextPageRequest {
    
    [self requestGET];
}

- (void)requestGET {
    
    NSAssert(self.urlStr, @"Request url is null");
    
    NSDictionary *parameters = nil;
    if (self.pageingHandler && [self.pageingHandler respondsToSelector:@selector(parametersWithPagingRequest:originalParameters:)]) {
        
        parameters = [self.pageingHandler parametersWithPagingRequest:self originalParameters:nil];
    }
        
    if(!parameters) parameters = [NSDictionary dictionaryWithObjects:@[@(_pageNumber), @(_pageSize)] forKeys:@[kDefaultPagingRequestPageNumKey, kDefaultPagingRequestPageSizeKey]];
    
    __weak typeof(self) weakSelf = self;
    if (self.requestType == CCPagingRequestTypeGET) {
        
        [self requestGET:self.urlStr parameters:parameters response:^(CCResponseMetaModel *metaModel) {
            
            [weakSelf _requestEndWithMetaModel:metaModel];
        }];
    } else if (self.requestType == CCPagingRequestTypePOST) {
        
        [self requestPOST:self.urlStr parameters:parameters response:^(CCResponseMetaModel *metaModel) {
            
            [weakSelf _requestEndWithMetaModel:metaModel];
        }];
    }
}

- (void)_requestEndWithMetaModel:(CCResponseMetaModel *)metaModel {
    
    if (metaModel.success) {
        
        if (self.pageNumber == 1) [self.dataSource removeAllObjects];
        
        NSArray *datas = [NSArray arrayWithArray:metaModel.rawData];
        
        [self.dataSource addObjectsFromArray:datas];
        
        BOOL noMoreData = NO;
        if (datas.count < self.pageSize) {
            
            noMoreData = YES;
            if (self.pageingHandler && [self.pageingHandler respondsToSelector:@selector(pagingRequestHasNoMoreData:)]) {
                
                [self.pageingHandler pagingRequestHasNoMoreData:self];
            }
        } else {
            
            self.pageNumber++;
        }
    }
    
    if (self.pageingHandler && [self.pageingHandler respondsToSelector:@selector(pagingRequestDidEnd:metaData:)]) {
        
        [self.pageingHandler pagingRequestDidEnd:self metaData:metaModel];
    }
}

- (NSMutableArray *)dataSource {
    
    if (_dataSource) return _dataSource;
    
    _dataSource = @[].mutableCopy;
    
    return _dataSource;
}


@end
