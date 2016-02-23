//
//  CITDatabaseSchema.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDatabaseSchema.h"


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
