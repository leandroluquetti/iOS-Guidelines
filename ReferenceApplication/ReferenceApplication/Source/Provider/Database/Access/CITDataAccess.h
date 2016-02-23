//
//  CITDataAccess.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "CITDatabaseProvider.h"
#import "CITDatabaseQueue.h"

typedef void (^CITDataAccessQueryResponse) (NSArray *result);
typedef void (^CITDataAccessUpdateResponse) (BOOL success);
typedef void (^CITDataAccessQueryResultSetResponse) (FMResultSet *rs);
typedef void (^CITDataAccessQueryResponseWithSucess) (BOOL success, NSDictionary *result);
typedef void (^CITDataAccessQueryDicResponseWithSucess) (BOOL success, NSDictionary * result);
typedef void (^CITDataAccessQueryArrayResponse) (NSMutableArray * result);
typedef void (^CITDataAccessQueryArrayResponseWithSucess) (BOOL success, NSMutableArray * result);
@interface CITDataAccess : NSObject

@end
