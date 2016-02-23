//
//  CITClientBO.m
//  ReferenceApplication
//
//  Created by Gian Nucci on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITClientBO.h"
#import "CITDataAccess+Client.h"
#import "CITClient.h"

@implementation CITClientBO

+ (void)insertClient:(CITClient *)client
  andCompletionBlock:(void(^)(BOOL success))completion {
    
    [CITDataAccess insertRow:client withCompletionBlock:^(BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(success);
        });
    }];
}

+ (void)getAllClientsWithCompletionBlock:(void(^)(NSArray *result))completion {
    [CITDataAccess getAllWithCompletionBlock:^(NSArray *result) {
       dispatch_async(dispatch_get_main_queue(), ^{
           completion(result);
       });
    }];
}

@end
