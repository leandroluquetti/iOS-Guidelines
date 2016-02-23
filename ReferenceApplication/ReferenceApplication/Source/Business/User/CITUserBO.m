//
//  RAUserBO.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITUserBO.h"
#import "RAHTTPSessionProvider+User.h"


@implementation CITUserBO


#pragma mark - Services

+ (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  success:(void(^)(CITUser *user))success
                  failure:(void(^)(NSError *error))failure {
    
    RAHTTPSessionProvider *sessionManager = [RAHTTPSessionProvider sharedInstance];
    
    [sessionManager loginWithUsername:user
                             password:password
                              success:^(NSURLSessionDataTask *task, id responseObject)
     {
         CITUser *user = [[CITUser alloc] initWithLoginResponse:responseObject];
         success(user);
         
     } failure:^(NSError *error) {
         
         //error handling
         
         failure(error);
     }];
}

@end
