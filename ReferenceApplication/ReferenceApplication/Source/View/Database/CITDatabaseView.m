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
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation CITDatabaseView

- (void)awakeFromNib {
    [self.clientIdTextField setPlaceholder:NSLocalizedString(@"databaseExample.placeholder.id", @"Identifier")];
    [self.firstNameTextField setPlaceholder:NSLocalizedString(@"databaseExample.placeholder.firstname", @"First Name")];
    [self.surnameTextField setPlaceholder:NSLocalizedString(@"databaseExample.placeholder.surname", @"Surname")];

    [self.addButton setTitle:NSLocalizedString(@"databaseExample.button.add", @"ADD") forState:UIControlStateNormal];
}

- (CITClient *)prepareClientObject {
    if ([self.clientIdTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length <= 0 ||
        [self.firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length <= 0 ||
        [self.surnameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length <= 0 ) {
        return nil;
    }
    
    CITClient *client = [CITClient new];
    client.registerId = @(self.clientIdTextField.text.integerValue);
    client.firstName = self.firstNameTextField.text;
    client.surname = self.surnameTextField.text;
    
    return client;
}

- (void)clearFields {
    self.clientIdTextField.text = nil;
    self.firstNameTextField.text = nil;
    self.surnameTextField.text = nil;
}

- (BOOL)textFieldIsEqualToClientsIdField:(UITextField *)textField {
    return [textField isEqual:self.clientIdTextField];
}

@end
