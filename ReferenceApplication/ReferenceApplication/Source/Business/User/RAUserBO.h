//
//  RAUserBO.h
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RABaseBO.h"
#import "RAUser.h"

@interface RAUserBO : RABaseBO

+ (void)loginWithUsername:(NSString *)user
                 password:(NSString *)password
                  success:(void(^)(RAUser *user))success
                  failure:(void(^)(NSError *error))failure;

@end
