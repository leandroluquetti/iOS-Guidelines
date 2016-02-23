//
//  CITDatabaseExampleManager.m
//  ReferenceApplication
//
//  Created by Gian Nucci on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDatabaseExampleManager.h"
#import "CITClient.h"
#import "CITClientBO.h"

@implementation CITDatabaseExampleManager

- (void)insertClient:(CITClient *)client
 withCompletionBlock:(void(^)(BOOL success))completion {

    [self.mainQueue addOperationWithBlock:^{
        
        [CITClientBO insertClient:client andCompletionBlock:completion];
    }];
}

- (void)getAllClientsWithCompletionBlock:(void(^)(NSArray *result))completion {
    [self.mainQueue addOperationWithBlock:^{
        [CITClientBO getAllClientsWithCompletionBlock:completion];
    }];
}

@end
