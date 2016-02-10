//
//  RAHTTPSessionManager.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^RARequestOperationBlockSuccess) (NSURLSessionDataTask *task, id responseObject);
typedef void (^RARequestOperationBlockFailure) (NSError *error);

@interface RAHTTPSessionProvider : AFHTTPSessionManager

+ (instancetype)sharedInstance;
- (NSString *)setEndpointVersion:(NSString *)endpoint;

@end
