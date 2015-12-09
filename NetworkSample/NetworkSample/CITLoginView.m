//
//  CITLoginView.m
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/8/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITLoginView.h"

@implementation CITLoginView

- (void)dismissKeyboard {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
