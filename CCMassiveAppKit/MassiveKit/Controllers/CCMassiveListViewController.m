//
//  BaseListViewController.m
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

#import "CCMassiveListViewController.h"

@interface CCMassiveListViewController ()

@end

@implementation CCMassiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {

    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
//    _tableView.estimatedRowHeight = 0;
//    _tableView.estimatedSectionFooterHeight = 0;
//    _tableView.estimatedSectionHeaderHeight = 0;
    return _tableView;
}

- (NSMutableArray *)dataSource {

    if (_dataSource) return _dataSource;
    
    _dataSource = [NSMutableArray new];
    return _dataSource;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseIdentifier"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"baseIdentifier"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return nil;
}

@end
