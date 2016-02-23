//
//  CITDataAccess+Client.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDataAccess+Client.h"
#import "RAClient.h"

@implementation CITDataAccess (Client)

static NSString * const kInsertOrReplaceClient = @"INSERT OR REPLACE INTO client VALUES (?, ?, ?);";
static NSString * const kSelectAllClient = @"SELECT * FROM client;";

+ (void)insertRow:(RAClient *)entity withCompletionBlock:(CITDataAccessUpdateResponse)completion {
    CITDatabaseQueue *databaseQueue = [[CITDatabaseProvider sharedProvider] databaseQueue];
    [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL success = NO;
        
        success = [db executeUpdate:kInsertOrReplaceClient withArgumentsInArray:@[entity.registerId,
                                                                               entity.firstName,
                                                                               entity.surname]];
        
        if (!success) {
            *rollback = !success;
        }
        
        completion(success);
    }];
}

+ (void)getAllWithCompletionBlock:(CITDataAccessQueryResponse)completion {
    CITDatabaseQueue *databaseQueue = [[CITDatabaseProvider sharedProvider] databaseQueue];
    [databaseQueue inDatabase:^(FMDatabase *db) {
        
        NSMutableArray *entities = [NSMutableArray array];
        FMResultSet *resultSet = [db executeQuery:kSelectAllClient];
        
        while (resultSet.next) {
            RAClient *entity = [RAClient parseFromResultSet:resultSet];
            [entities addObject:entity];
        }
        
        completion(entities);
    }];
}

@end