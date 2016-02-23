//
//  CITUserBO.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseBO.h"
#import "CITUser.h"

@interface CITUserBO : CITBaseBO

+ (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  success:(void(^)(CITUser *user))success
                  failure:(void(^)(NSError *error))failure;

@end
