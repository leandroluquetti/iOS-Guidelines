//
//  CITDatabaseProvider.h
//  ReferenceApplication
//
//  Created by SwatTeam on 25/01/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CITDatabaseQueue.h"

@protocol CITDatabaseSchemaMigration <NSObject>

- (NSInteger)newVersion;

@end

@protocol CITDatabaseSchema <NSObject>

- (NSInteger)schemaVersion;
- (NSArray *)createTableQueries;
- (NSArray *)createIndexQueries;

@optional
- (void)runMigrationWithDatabase:(FMDatabase *)db;

@end

@interface CITDatabaseProvider : NSObject

+ (void)registerDatabase:(NSString *)_databaseName forUser:(NSString *)_databaseUser withDatabaseSchema:(id<CITDatabaseSchema>)_databaseSchema;
+ (CITDatabaseProvider *)sharedProvider;
+ (void)addMigrationSchema:(id<CITDatabaseSchemaMigration>)databaseSchemaMigration;
- (void)deleteCurrentDatabase;
- (CITDatabaseQueue *) databaseQueue;
- (void)setup;

@end
