//
//  CITHTTPSessionManager.h
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "CITServiceBlocks.h"

@interface CITHTTPSessionProvider : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
