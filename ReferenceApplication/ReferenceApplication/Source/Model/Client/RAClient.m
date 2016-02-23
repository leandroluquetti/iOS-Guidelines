//
//  RAClient.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAClient.h"

@implementation RAClient

+ (instancetype)parseFromResultSet:(FMResultSet *)resultSet {
    RAClient *client = [RAClient new];
    client.registerId = @([resultSet intForColumn:@"id"]);
    client.firstName = [resultSet stringForColumn:@"first_name"];
    client.surname = [resultSet stringForColumn:@"surname"];
    
    return client;
}

@end
