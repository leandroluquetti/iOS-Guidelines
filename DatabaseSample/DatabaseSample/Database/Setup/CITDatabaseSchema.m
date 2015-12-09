//
//  CITDatabaseSchema.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDatabaseSchema.h"

#warning 1 - DATABASE SCHEMA

@interface CITDatabaseSchema ()

@end

@implementation CITDatabaseSchema

- (NSInteger)newVersion {
    return 1;
}

- (NSInteger)schemaVersion {
    return 0;
}

- (NSArray *)createTableQueries {
    NSMutableArray *tableQueries = [NSMutableArray array];
    
    NSString *order = @"CREATE TABLE IF NOT EXISTS [client] ("
    "[id] BIGINT, "
    "[first_name] TEXT, "
    "[surname] TEXT, "
    "PRIMARY KEY (id)"
    ");";
    [tableQueries addObject:order];
    
    return tableQueries;
}

- (NSArray *)createIndexQueries {
    return @[];
}

@end
