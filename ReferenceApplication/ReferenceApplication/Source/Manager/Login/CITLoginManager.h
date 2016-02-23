//
//  CITLoginManager.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseManager.h"
#import "CITUser.h"

@interface CITLoginManager : CITBaseManager

- (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                 withCompletionBlock:(void(^)(CITUser *user, BOOL success))completion;

@end
