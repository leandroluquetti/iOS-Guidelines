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

+ (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  success:(void(^)(RAUser *user))success
                  failure:(void(^)(NSError *error))failure
{
    RAHTTPSessionProvider *sessionManager = [RAHTTPSessionProvider sharedInstance];
    
    [sessionManager loginWithUsername:user
                             password:password
                              success:^(NSURLSessionDataTask *task, id responseObject)
     {
         RAUser *user = [RAUser new];
         
         success(user);
         
     } failure:^(NSError *error) {
         
         //error handling
         
         failure(error);
     }];
}

@end
