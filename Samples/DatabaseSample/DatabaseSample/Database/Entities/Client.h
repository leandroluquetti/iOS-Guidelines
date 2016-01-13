//
//  TestTable.h
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMResultSet.h>

@interface Client : NSObject

@property (copy, nonatomic) NSNumber *registerId;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *surname;

+ (instancetype)parseFromResultSet:(FMResultSet *)resultSet;

@end
