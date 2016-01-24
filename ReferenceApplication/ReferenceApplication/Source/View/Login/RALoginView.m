//
//  RALoginView.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RALoginView.h"
#import "RATextField.h"

@interface RALoginView ()

@property (weak, nonatomic) IBOutlet RATextField *userTextField;
@property (weak, nonatomic) IBOutlet RATextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation RALoginView

#pragma mark - Override

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.userTextField.placeholder = NSLocalizedString(@"loginScreen.placeholder.user", @"Username placeholder");
    self.passwordTextField.placeholder = NSLocalizedString(@"loginScreen.placeholder.password", @"Password placeholder");
    [self.loginButton setTitle:NSLocalizedString(@"loginScreen.button.login", @"Login button title") forState:UIControlStateNormal];
}

#pragma mark - Getters/Setters

- (NSString *)userText {
    NSString *user = [self.userTextField textWithoutSpace];

    return user;
}

- (NSString *)passwordText {
    NSString *password = [self.passwordTextField textWithoutSpace];

    return password;
}

#pragma mark - Actions

- (void)dismissKeyboard {
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)showLoadingView:(BOOL)show {
    self.loadingView.hidden = !show;
}

- (void)invalidField:(RALoginFieldType)fieldTye {
    switch (fieldTye) {
        case RALoginFieldUser: {
            [self.userTextField invalidate];
            break;
        }
        case RALoginFieldPassword: {
            [self.passwordTextField invalidate];
            break;
        }
        case RALoginFieldAll: {
            [self.userTextField invalidate];
            [self.passwordTextField invalidate];
            break;
        }
    }
}

@end
