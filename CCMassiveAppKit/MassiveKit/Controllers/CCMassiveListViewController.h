//
//  BaseListViewController.h
//  PandaTakeaway
//
//  Created by smufs on 2017/5/17.
//  Copyright © 2017年 李冰. All rights reserved.
//

#import "CCMassiveViewController.h"

@interface CCMassiveListViewController : CCMassiveViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
