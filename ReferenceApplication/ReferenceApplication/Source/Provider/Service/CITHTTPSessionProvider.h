//
//  CITHTTPSessionManager.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^CITRequestOperationBlockSuccess) (NSURLSessionDataTask *task, id responseObject);
typedef void (^CITRequestOperationBlockFailure) (NSError *error);

@interface CITHTTPSessionProvider : AFHTTPSessionManager

+ (instancetype)sharedInstance;
- (NSString *)setEndpointVersion:(NSString *)endpoint;

@end
