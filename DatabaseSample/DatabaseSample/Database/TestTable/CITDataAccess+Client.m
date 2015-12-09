//
//  CITDataAccess+TestTable.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDataAccess+Client.h"
#import "Client.h"

//TODO 2 - DATA ACCESS CATEGORY - fazer link com documento (uma breve explicação, formatar melhor a explicação)

static NSString * const kCITInsertTestTable = @"INSERT OR REPLACE INTO client VALUES (?, ?, ?);";
static NSString * const kCITSelectAllTestTable = @"SELECT * FROM client;";

@implementation CITDataAccess (Client)

+ (void)insertRow:(Client *)entity withCompletionBlock:(CITDataAccessUpdateResponse)completion {
    CITDatabaseQueue *databaseQueue = [[CITDatabaseManager sharedManager] databaseQueue];
    [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL success = NO;
        
        success = [db executeUpdate:kCITInsertTestTable withArgumentsInArray:@[entity.registerId,
                                                                               entity.firstName,
                                                                               entity.surname]];
        
        if (!success) {
            *rollback = !success;
        }
        
        completion(success);
    }];
}

+ (void)getAllWithCompletionBlock:(CITDataAccessQueryResponse)completion {
    CITDatabaseQueue *databaseQueue = [[CITDatabaseManager sharedManager] databaseQueue];
    [databaseQueue inDatabase:^(FMDatabase *db) {
        
        NSMutableArray *entities = [NSMutableArray array];
        FMResultSet *resultSet = [db executeQuery:kCITSelectAllTestTable];
        
        while (resultSet.next) {
            Client *entity = [Client parseFromResultSet:resultSet];
            [entities addObject:entity];
        }
        
        completion(entities);
    }];
}

@end
