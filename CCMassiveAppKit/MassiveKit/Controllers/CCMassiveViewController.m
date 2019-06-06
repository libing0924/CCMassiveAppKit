//
//  BaseViewController.m
//  ALLEYOOP
//
//  Created by 李冰 on 2019/2/11.
//  Copyright © 2019 ALLEYOOP. All rights reserved.
//

#import "CCMassiveViewController.h"

@interface CCMassiveViewController ()

@property (nonatomic, strong) CCSimpleRequest *request;

@end

@implementation CCMassiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self localizedLanguageDidChanged];
    
}

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response {
    
    [_request requestGET:urlStr parameters:params response:response];
}

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response {
    
    [_request requestPOST:urlStr parameters:params response:response];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (void)localizedLanguageDidChanged {
    
}

@end
