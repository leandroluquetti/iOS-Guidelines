//
//  CITHTTPSessionManager.m
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionProvider.h"

//TODO 1

static NSString * const kBaseURL = @"https://api.parse.com";

@implementation CITHTTPSessionProvider

#pragma mark - Singleton

+ (instancetype)sharedInstance {

    static CITHTTPSessionProvider *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kBaseURL];
        _sharedInstance = [[CITHTTPSessionProvider alloc] initWithBaseURL:url];
    });
    
    return _sharedInstance;
}

#pragma mark - Override

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"oUZjvMyLohNCAlAmoi8rWQdUq1MXyDNxHvjTwVUM"
                      forHTTPHeaderField:@"X-Parse-Application-Id"];
        [self.requestSerializer setValue:@"lr9YZR4n4eJ0DGTlp46rxKgWdlF2V4k3L2djCIoL"
                      forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

@end
