//
//  CITDataAccess.h
//  Survey
//
//  Created by Bruno Koga on 12/10/12.
//  Copyright (c) 2012 Tetra Pak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "CITDatabaseManager.h"
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
