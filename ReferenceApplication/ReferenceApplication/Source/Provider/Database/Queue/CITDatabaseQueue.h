//
//  CITDatabaseQueue.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@interface CITDatabaseQueue : FMDatabaseQueue

+ (id)databaseQueueWithPath:(NSString *)aPath andKey:(NSString*)key;
- (FMDatabase*)database;
@end
