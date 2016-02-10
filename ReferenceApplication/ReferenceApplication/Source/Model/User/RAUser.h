//
//  RAUser.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RAUser : NSObject

- (instancetype)initWithLoginResponse:(id)serviceResponse;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *email;

@end
