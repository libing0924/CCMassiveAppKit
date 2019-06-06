//
//  CCSimpleRequest.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCSimpleRequest.h"

@implementation CCSimpleRequest

- (void)requestGET:(NSString *)urlStr parameters:(NSDictionary *)params bindModel:(Class)modelClass response:(void (^)(CCResponseMetaModel *))response {
    
    [super requestGET:urlStr parameters:params response:^(CCResponseMetaModel *metaModel) {
        
        
    }];
}

- (void)requestPOST:(NSString *)urlStr parameters:(NSDictionary *)params bindModel:(Class)modelClass response:(void (^)(CCResponseMetaModel *))response {
    
    [super requestPOST:urlStr parameters:params response:^(CCResponseMetaModel *metaModel) {
        
        
    }];
}

@end
