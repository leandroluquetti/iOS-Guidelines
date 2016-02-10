//
//  RALoginViewController.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RALoginViewController.h"
#import "RALoginView.h"
#import "RALoginManager.h"

@interface RALoginViewController ()

@property (strong, nonatomic) IBOutlet RALoginView *mainView;
@property (strong, nonatomic) RALoginManager *manager;
@property (strong, nonatomic) RAUser *loggedUser;

@end


@implementation RALoginViewController


#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Getters/Setters

- (RALoginView *)mainView {
    RALoginView *__weak view = (RALoginView *)self.view;
    
    return view;
}

- (RALoginManager *)manager {
    if (!_manager) {
        _manager = [RALoginManager new];
    }
    
    return _manager;
}

- (RAUser *)currentUser {
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
    
    [self.manager loginWithUsername:username password:password withCompletionBlock:^(RAUser *user, BOOL success) {
        [weakSelf handleLoginResponse:success withUser:user];
    }];
}

- (void)handleLoginResponse:(BOOL)status withUser:(RAUser *)user {
    [self.mainView showLoadingView:NO];
    
    if (status) {
        self.loggedUser = user;
        [self performSegueWithIdentifier:kFromLoginViewToWelcomeViewSegue sender:nil];
    } else {
        [self.mainView invalidField:RALoginFieldAll];
    }
}

@end
