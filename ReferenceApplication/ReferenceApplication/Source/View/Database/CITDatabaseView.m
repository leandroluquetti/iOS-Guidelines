//
//  CITDatabaseView.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDatabaseView.h"
#import "CITClient.h"

@interface CITDatabaseView()

@property (weak, nonatomic) IBOutlet UITextField *clientIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;

@end

@implementation CITDatabaseView

- (CITClient *)prepareClientObject {
    CITClient *client = [CITClient new];
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
