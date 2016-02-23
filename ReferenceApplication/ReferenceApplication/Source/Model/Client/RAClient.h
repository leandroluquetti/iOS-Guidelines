//
//  RAClient.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMResultSet.h>

@interface RAClient : NSObject

@property (copy, nonatomic) NSNumber *registerId;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *surname;

+ (instancetype)parseFromResultSet:(FMResultSet *)resultSet;

@end
