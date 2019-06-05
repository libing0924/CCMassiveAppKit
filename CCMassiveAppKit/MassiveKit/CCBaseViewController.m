//
//  BaseViewController.m
//  ALLEYOOP
//
//  Created by 李冰 on 2019/2/11.
//  Copyright © 2019 ALLEYOOP. All rights reserved.
//

#import "CCBaseViewController.h"

@interface CCBaseViewController ()

@property (nonatomic, strong) CCConvenientRequest *convenientRequest;

@end

@implementation CCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self localizedLanguageDidChanged];
    
    
}

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response {
    
    [_convenientRequest requestGET:urlStr parameters:params response:response];
}

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response {
    
    [_convenientRequest requestPOST:urlStr parameters:params response:response];
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
