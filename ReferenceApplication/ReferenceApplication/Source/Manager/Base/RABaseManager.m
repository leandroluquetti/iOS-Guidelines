//
//  RABaseManager.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/21/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RABaseManager.h"


@implementation RABaseManager

- (NSOperationQueue *)mainQueue {
    if (!_mainQueue) {
        _mainQueue = [NSOperationQueue new];
    }
    
    return _mainQueue;
}

@end
