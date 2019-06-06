//
//  CCAPagingViewController.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCAPagingViewController.h"

@interface CCAPagingViewController ()

@end

@implementation CCAPagingViewController

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.pagingRequest.urlStr = @"https://www.baidu.com";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
