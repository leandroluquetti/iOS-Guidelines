//
//  RALoginManager.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RALoginManager.h"
#import "RAUserBO.h"

@implementation RALoginManager

- (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  withCompletionBlock:(void(^)(RAUser *user, BOOL success))completion {

    [RAUserBO loginWithUsername:user password:password success:^(RAUser *user) {
        completion(user, YES);
    } failure:^(NSError *error) {
        completion(nil, NO);
    }];
}

@end
