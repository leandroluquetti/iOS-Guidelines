//
//  CITDataAccess+Client.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDataAccess+Client.h"
#import "CITClient.h"

@implementation CITDataAccess (Client)

static NSString * const kInsertClient = @"INSERT INTO client VALUES (?, ?, ?);";
static NSString * const kSelectAllClient = @"SELECT * FROM client;";

+ (void)insertRow:(CITClient *)entity withCompletionBlock:(CITDataAccessUpdateResponse)completion {
    CITDatabaseQueue *databaseQueue = [[CITDatabaseProvider sharedProvider] databaseQueue];
    [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL success = NO;
        
        success = [db executeUpdate:kInsertClient withArgumentsInArray:@[entity.registerId,
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
            CITClient *entity = [CITClient parseFromResultSet:resultSet];
            [entities addObject:entity];
        }
        
        completion(entities);
    }];
}

@end
