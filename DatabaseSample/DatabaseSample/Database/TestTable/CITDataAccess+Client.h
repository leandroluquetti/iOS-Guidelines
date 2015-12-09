//
//  CITDataAccess+TestTable.h
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDataAccess.h"

@class Client;

@interface CITDataAccess (Client)

+ (void)insertRow:(Client *)entity withCompletionBlock:(CITDataAccessUpdateResponse)completion;
+ (void)getAllWithCompletionBlock:(CITDataAccessQueryResponse)completion;

@end
