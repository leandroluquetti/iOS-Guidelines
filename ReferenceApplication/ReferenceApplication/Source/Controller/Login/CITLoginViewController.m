//
//  CITLoginViewController.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITLoginViewController.h"
#import "CITLoginView.h"
#import "CITLoginManager.h"

@interface CITLoginViewController ()

@property (readonly, nonatomic) CITLoginView *mainView;
@property (strong, nonatomic) CITLoginManager *manager;
@property (strong, nonatomic) CITUser *loggedUser;

@end


@implementation CITLoginViewController


#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Getters/Setters

- (CITLoginView *)mainView {
    return (CITLoginView *)self.view;
}

- (CITLoginManager *)manager {
    if (!_manager) {
        _manager = [CITLoginManager new];
    }
    
    return _manager;
}

- (CITUser *)currentUser {
    return self.loggedUser;
}


#pragma mark - Actions

- (IBAction)executeLogin:(UIButton *)sender {
    [self.mainView dismissKeyboard];
    [self login];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.mainView dismissKeyboard];
}


#pragma mark - Authentication

- (void)login {
    NSString *userText = [self.mainView userText];
    NSString *passwordText = [self.mainView passwordText];
    
    BOOL usernameError = ([userText length] <= 0);
    BOOL passwordError = ([passwordText length] <= 0);
    
    BOOL valid = (!usernameError && !passwordError);
    
    if (valid) {
        [self loginWithUsername:userText password:passwordText];
    } else {
        if (usernameError) {
            if (passwordError) {
                [self.mainView invalidField:RALoginFieldAll];
            } else {
                [self.mainView invalidField:RALoginFieldUser];
            }
        } else {
            [self.mainView invalidField:RALoginFieldPassword];
        }
    }
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password {
    typeof(self) __weak __block weakSelf = self;
    [self.mainView showLoadingView:YES];
    
    [self.manager loginWithUsername:username password:password withCompletionBlock:^(CITUser *user, BOOL success) {
        [weakSelf handleLoginResponse:success withUser:user];
    }];
}

- (void)handleLoginResponse:(BOOL)status withUser:(CITUser *)user {
    [self.mainView showLoadingView:NO];
    
    if (status) {
        self.loggedUser = user;
        [self performSegueWithIdentifier:kFromLoginViewToWelcomeViewSegue sender:nil];
    } else {
        [self.mainView invalidField:RALoginFieldAll];
    }
}

@end
