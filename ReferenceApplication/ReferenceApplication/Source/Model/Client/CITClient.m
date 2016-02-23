//
//  CITClient.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITClient.h"

@implementation CITClient

+ (instancetype)parseFromResultSet:(FMResultSet *)resultSet {
    CITClient *client = [CITClient new];
    client.registerId = @([resultSet intForColumn:@"id"]);
    client.firstName = [resultSet stringForColumn:@"first_name"];
    client.surname = [resultSet stringForColumn:@"surname"];
    
    return client;
}

@end
