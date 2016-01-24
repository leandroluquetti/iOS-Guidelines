//
//  RAUserBO.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAUserBO.h"
#import "RAHTTPSessionProvider+User.h"

@implementation RAUserBO

#pragma mark - Services

+ (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  success:(void(^)(RAUser *user))success
                  failure:(void(^)(NSError *error))failure {
    
    RAHTTPSessionProvider *sessionManager = [RAHTTPSessionProvider sharedInstance];
    
    [sessionManager loginWithUsername:user
                             password:password
                              success:^(NSURLSessionDataTask *task, id responseObject)
     {
         RAUser *user = [self userFromLoginResponse:responseObject];
         success(user);
         
     } failure:^(NSError *error) {
         
         //error handling
         
         failure(error);
     }];
}


#pragma mark - Parses

+ (RAUser *)userFromLoginResponse:(id)serviceResponse {
    RAUser *user;
    NSDictionary *responseObject = serviceResponse;
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        user = [RAUser new];
        user.name = responseObject[@"name"];
        user.email = responseObject[@"email"];
    }
    
    return user;
}

@end
