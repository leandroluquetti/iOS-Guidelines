//
//  RALoginView.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RALoginView.h"

@interface RALoginView ()

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation RALoginView

- (NSString *)userText {
    NSString *user = self.userTextField.text;

    return user;
}

- (NSString *)passwordText {
    NSString *password = self.passwordTextField.text;

    return password;
}

- (void)dismissKeyboard {
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)showLoadingView:(BOOL)show {
    self.loadingView.hidden = show;
}

- (void)invalidFiled:(RALoginFieldType)fieldTye {
    switch (fieldTye) {
        case RALoginFieldUser: {
            
            break;
        }
        case RALoginFieldPassword: {
            
            break;
        }
        case RALoginFieldAll: {
            
            break;
        }
    }
}

@end
