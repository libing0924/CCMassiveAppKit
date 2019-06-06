//
//  CCBasePagingViewController.m
//  BluetoothScale
//
//  Created by 李冰 on 2019/4/29.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCMassivePagingViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface CCMassivePagingViewController ()

@end

@implementation CCMassivePagingViewController

- (instancetype)init {

    if (self = [super init]) {

        _autoBeginRequest = YES;
        _pagingRequest = [[CCPagingRequest alloc] init];
        _pagingRequest.pagingHandler = self;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_headerRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_requestData)];

    if (_autoBeginRequest && _pagingRequest.urlStr) {

        [self.tableView.mj_header beginRefreshing];
    }
}

- (void)_requestData {

    self.tableView.mj_header.hidden = YES;
    [self.pagingRequest firstPageRequest];
}

- (void)_headerRefresh {

    self.tableView.mj_footer.hidden = YES;
    [self.pagingRequest nextPageRequest];
}

- (void)_stopAnimation {

    self.tableView.mj_header.hidden = NO;
    self.tableView.mj_footer.hidden = NO;
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

#pragma mark - CCPagingRawDataHandler
- (void)pagingRequestHasNoMoreData:(CCPagingRequest *)pagingRequest {
    
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

- (void)pagingRequestDidEnd:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel {
    
    [self _stopAnimation];
//    Class ripeModel = nil;
//    if ([self respondsToSelector:@selector(ripeModel)]) {
//
//        ripeModel = [self ripeModel];
//    }
//    
//    if (ripeModel) {
//
//         [self.dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:ripeModel json:metaModel.contentData]];
//    } else {
//
//        [self.dataSource addObjectsFromArray:metaModel.contentData];
//    }
    
    [self.dataSource addObjectsFromArray:metaModel.contentData];
    
    [self.tableView reloadData];
}

- (NSUInteger)pagingRequestTotalData:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel {
    
    return 0;
}

- (NSDictionary *)parametersWithPagingRequest:(CCPagingRequest *)pagingRequest originalParameters:(NSDictionary *)originalParameters {
    
    return originalParameters;
}

@end
