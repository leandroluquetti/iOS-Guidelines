//
//  CITHTTPSessionManager+Login.m
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/2/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager+Login.h"

//TODO 2

@implementation CITHTTPSessionManager (Login)

+ (void)executeLoginWithUsername:(NSString *)username
                     andPassword:(NSString *)passwod
             withCompletionBlock:(CITServiceRequestSuccessful)completion {

    NSDictionary *parameters = @{@"username": username,
                                 @"password": passwod};
    
    [[self sharedInstance] GET:@"/1/login"
                    parameters:parameters
                       success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                           completion(YES);
                       } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                           completion(NO);
                       }];
}

@end
