//
//  CITHTTPSessionManager+User.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITHTTPSessionProvider.h"

@interface CITHTTPSessionProvider (User)

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
                  success:(CITRequestOperationBlockSuccess)success
                  failure:(CITRequestOperationBlockFailure)failure;

@end
