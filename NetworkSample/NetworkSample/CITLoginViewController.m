//
//  CITLoginViewController.m
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/8/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITLoginViewController.h"
#import "CITHTTPSessionManager+Login.h"
#import "CITLoginView.h"

@interface CITLoginViewController ()

@property (readonly, nonatomic) CITLoginView *mainView;

@end

@implementation CITLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)handleLoginResponse:(BOOL)status {
    
    self.mainView.loadingView.hidden = YES;
    if (status) {
        [self performSegueWithIdentifier:@"fromLoginToDashboard" sender:self];
    } else {
        [self showLoginMessageError];
    }
}

- (void)showLoginMessageError {
    UIAlertController *__block alertController = [UIAlertController alertControllerWithTitle:@"Login Error"
                                                                             message:@"Invalid username and/or password! Please try again!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertController dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)executeLogin:(UIButton *)sender {
    
    self.mainView.loadingView.hidden = NO;
    
    [self.mainView dismissKeyboard];
    
    NSString *username = self.mainView.usernameTextField.text;
    NSString *password = self.mainView.passwordTextField.text;
    
    typeof(self) __weak __block weakSelf = self;
    
    [CITHTTPSessionManager executeLoginWithUsername:username
                                        andPassword:password
                                withCompletionBlock:^(BOOL status) {
                                    [weakSelf handleLoginResponse:status];
                                }];
}

#pragma mark - Getters/Setters

- (CITLoginView *)mainView {
    CITLoginView *__weak view = (CITLoginView *)self.view;
    return view;
}

@end
