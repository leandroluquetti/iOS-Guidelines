//
//  CITHTTPSessionManager+Login.h
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/2/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager.h"

@interface CITHTTPSessionManager (Login)

+ (void)executeLoginWithUsername:(NSString *)username andPassword:(NSString *)passwod withCompletionBlock:(CITServiceRequestSuccessful)completion;

@end
