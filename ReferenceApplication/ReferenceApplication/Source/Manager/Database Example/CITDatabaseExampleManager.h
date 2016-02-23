//
//  CITDatabaseExampleManager.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseManager.h"

@class CITClient;

@interface CITDatabaseExampleManager : CITBaseManager

- (void)insertClient:(CITClient *)client
 withCompletionBlock:(void(^)(BOOL success))completion;

- (void)getAllClientsWithCompletionBlock:(void(^)(NSArray *result))completion;

@end
