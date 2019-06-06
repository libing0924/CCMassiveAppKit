//
//  ViewController.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/5.
//  Copyright © 2019 CC. All rights reserved.
//

#import "ViewController.h"
#import "CCSimpleRequest.h"

// teamA 编写的接口
#import "CCTeamARequestHandler.h"
// teamB 编写的接口
#import "CCTeamBRequestHandler.h"

// 分页controller
#import "CCAPagingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // request根据全局代理发起请求
    CCSimpleRequest *request = [CCSimpleRequest new];
    [request requestGET:@"https://www.baidu.com" parameters:nil response:^(CCResponseMetaModel *metaModel) {
        
    }];
}

- (IBAction)requestA:(id)sender {
    
    // aRequest根据teamA接口规范发起请求
    CCSimpleRequest *aRequest = [CCSimpleRequest new];
    aRequest.requestHandler = [CCTeamARequestHandler new];
    [aRequest requestGET:@"https://www.baidu.com" parameters:nil response:^(CCResponseMetaModel *metaModel) {
        
        
    }];
}

- (IBAction)requestB:(id)sender {
    
    // bRequest根据teamB接口规范发起请求
    CCSimpleRequest *bRequest = [CCSimpleRequest new];
    bRequest.requestHandler = [CCTeamBRequestHandler new];
    [bRequest requestGET:@"https://www.baidu.com" parameters:nil response:^(CCResponseMetaModel *metaModel) {
        
        
    }];
}

- (IBAction)toPagingA:(id)sender {
    
    [self presentViewController:CCAPagingViewController.new animated:YES completion:nil];
}
@end
