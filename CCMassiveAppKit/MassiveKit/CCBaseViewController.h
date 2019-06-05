//
//  BaseViewController.h
//  ALLEYOOP
//
//  Created by 李冰 on 2019/2/11.
//  Copyright © 2019 ALLEYOOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CCConvenientRequest.h>

@interface CCBaseViewController : UIViewController

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params response:(nullable void (^)(CCResponseMetaModel *metaModel))response;

- (void)localizedLanguageDidChanged;

@end
