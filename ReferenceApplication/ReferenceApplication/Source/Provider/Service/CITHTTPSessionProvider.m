//
//  CITHTTPSessionManager.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITHTTPSessionProvider.h"

static NSString * const kBaseURL = @"https://api.parse.com";
static NSString * const kEndPointVersion = @"1";


@implementation CITHTTPSessionProvider


#pragma mark - Singleton

+ (instancetype)sharedInstance {
    
    static CITHTTPSessionProvider * _sharedInstance = nil;
    
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
        [self configureSecurityPolicy];
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    
        [self.requestSerializer setValue:@"oUZjvMyLohNCAlAmoi8rWQdUq1MXyDNxHvjTwVUM"
                       forHTTPHeaderField:@"X-Parse-Application-Id"];
        [self.requestSerializer setValue:@"lr9YZR4n4eJ0DGTlp46rxKgWdlF2V4k3L2djCIoL"
                      forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    
    return self;
}


#pragma mark - SSL Pinning

- (void)configureSecurityPolicy {
    
    NSSet *certificates = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
    
    if (certificates.count > 0) {
        AFSecurityPolicy *securityPolicy  = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate
                                                             withPinnedCertificates:certificates];
        self.securityPolicy = securityPolicy;    
    }
}


#pragma mark - 

- (NSString *)setEndpointVersion:(NSString *)endpoint {
    NSString *endpointWithVersion = [NSString stringWithFormat:@"/%@/%@", kEndPointVersion, endpoint];
    
    return endpointWithVersion;
}

@end
