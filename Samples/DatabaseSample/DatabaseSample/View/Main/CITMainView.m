//
//  CITMainView.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITMainView.h"
#import "Client.h"

@interface CITMainView ()

@property (weak, nonatomic) IBOutlet UITextField *clientIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;

@end

@implementation CITMainView

- (Client *)prepareClientObject {
    Client *client = [Client new];
    client.registerId = @(self.clientIdTextField.text.integerValue);
    client.firstName = self.firstNameTextField.text;
    client.surname = self.surnameTextField.text;
    
    [self clearFields];
    
    return client;
}

- (void)clearFields {
    self.clientIdTextField.text = nil;
    self.firstNameTextField.text = nil;
    self.surnameTextField.text = nil;
    
    [self.clientIdTextField becomeFirstResponder];
}

- (BOOL)textFieldIsEqualToClientsIdField:(UITextField *)textField {
    return [textField isEqual:self.clientIdTextField];
}

@end
