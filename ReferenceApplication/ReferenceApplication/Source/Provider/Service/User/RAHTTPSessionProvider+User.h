//
//  RAHTTPSessionManager+User.h
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAHTTPSessionProvider.h"

@interface RAHTTPSessionProvider (User)

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
                  success:(RARequestOperationBlockSuccess)success
                  failure:(RARequestOperationBlockFailure)failure;

@end
