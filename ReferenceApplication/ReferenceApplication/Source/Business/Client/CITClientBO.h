//
//  CITClientBO.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseBO.h"

@class CITClient;

@interface CITClientBO : CITBaseBO

+ (void)insertClient:(CITClient *)client
  andCompletionBlock:(void(^)(BOOL success))completion;

+ (void)getAllClientsWithCompletionBlock:(void(^)(NSArray *result))completion;
    
@end
