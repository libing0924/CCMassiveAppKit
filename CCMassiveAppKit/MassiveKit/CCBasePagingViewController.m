//
//  CCBasePagingViewController.m
//  BluetoothScale
//
//  Created by 李冰 on 2019/4/29.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCBasePagingViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface CCBasePagingViewController ()

@end

@implementation CCBasePagingViewController

- (instancetype)init {

    if (self = [super init]) {

        _autoBeginRequest = YES;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_headerRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_requestData)];

    _pagingRequest = [[CCPagingRequest alloc] init];
    self.pagingRequest.pageingHandler = self;

    if (_autoBeginRequest) {

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

    return self.pagingRequest.dataSource.count;
}

#pragma mark - CCPagingRawDataHandler

- (NSDictionary *)parametersWithPagingRequest:(CCPagingRequest *)pagingRequest originalParameters:(NSDictionary *)originalParameters {

    return [self requestParametersWithOriginalPatameters:originalParameters];
}

- (void)pagingRequestDidEnd:(CCPagingRequest *)pagingRequest metaData:(CCResponseMetaModel *)metaModel {

    [self _stopAnimation];
    if (metaModel.success) {

        [self.tableView reloadData];
    }
}

- (void)pagingRequestHasNoMoreData:(CCPagingRequest *)pagingRequest {

    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark - Sub class implement
- (Class)needRipeModel {

    return nil;
}

- (NSDictionary *)requestParametersWithOriginalPatameters:(NSDictionary *)originalPatameters {

    return originalPatameters;
}

@end
