//
//  RALoginManager.h
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RABaseManager.h"
#import "RAUser.h"

@interface RALoginManager : RABaseManager

- (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                 withCompletionBlock:(void(^)(RAUser *user, BOOL success))completion;

@end
