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
    if (!_manager)
    {
        _manager = [RALoginManager new];
    }
    
    return _manager;
}

#pragma mark - Actions

- (IBAction)executeLogin:(UIButton *)sender {
    
    [self.mainView dismissKeyboard];
    [self.mainView showLoadingView:YES];
    
    NSString *userText = [self.mainView userText];
    NSString *passwordText = [self.mainView passwordText];
    
    typeof(self) __weak __block weakSelf = self;
    
    [self.manager loginWithUsername:userText password:passwordText withCompletionBlock:^(RAUser *user, BOOL success) {
        [weakSelf handleLoginResponse:success withUser:user];
    }];
}

#pragma mark - Common

- (void)handleLoginResponse:(BOOL)status withUser:(RAUser *)user {
    [self.mainView showLoadingView:NO];
    
    if (status) {
        [self performSegueWithIdentifier:@"fromLoginToDashboard" sender:self];
    } else {
        [self.mainView invalidFiled:RALoginFieldAll];
    }
}

@end
