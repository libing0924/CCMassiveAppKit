//
//  CCTeamBRequestHandler.m
//  CCMassiveAppKit
//
//  Created by 李冰 on 2019/6/6.
//  Copyright © 2019 CC. All rights reserved.
//

#import "CCTeamBRequestHandler.h"

@implementation CCTeamBRequestHandler

- (NSDictionary *)headerFromRequest:(CCNetworkRequest *)request urlString:(NSString *)urlString {
    
    return @{@"userToken":@"Bearer Adot2Ampe"};
}

@end
