//
//  RAUser.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAUser.h"

@implementation RAUser

#pragma mark - Inits

- (instancetype)initWithLoginResponse:(id)serviceResponse {
    if (self = [super init]) {
        [self userFromLoginResponse:serviceResponse];
    }
    
    return self;
}

#pragma mark - Parses

- (void)userFromLoginResponse:(id)response {
    NSDictionary *responseObject = response;
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        self.name = responseObject[@"name"];
        self.email = responseObject[@"email"];
    }
}

@end
