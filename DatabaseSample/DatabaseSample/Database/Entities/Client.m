//
//  TestTable.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "Client.h"

@implementation Client

+ (instancetype)parseFromResultSet:(FMResultSet *)resultSet {
    Client *client = [Client new];
    client.registerId = @([resultSet intForColumn:@"id"]);
    client.firstName = [resultSet stringForColumn:@"first_name"];
    client.surname = [resultSet stringForColumn:@"surname"];
    
    return client;
}

@end
