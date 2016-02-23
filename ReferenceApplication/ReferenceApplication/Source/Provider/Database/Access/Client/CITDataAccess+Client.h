//
//  CITDataAccess+Client.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDataAccess.h"

@class CITClient;

@interface CITDataAccess (Client)

+ (void)insertRow:(CITClient *)entity withCompletionBlock:(CITDataAccessUpdateResponse)completion;
+ (void)getAllWithCompletionBlock:(CITDataAccessQueryResponse)completion;

@end
