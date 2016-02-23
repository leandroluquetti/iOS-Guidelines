//
//  RALoginManager.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITLoginManager.h"
#import "CITUserBO.h"


@implementation CITLoginManager

- (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  withCompletionBlock:(void(^)(CITUser *user, BOOL success))completion {

    [CITUserBO loginWithUsername:user password:password success:^(CITUser *user) {
        completion(user, YES);
    } failure:^(NSError *error) {
        completion(nil, NO);
    }];
}

@end
