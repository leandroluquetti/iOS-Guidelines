//
//  RADatabaseView.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseView.h"

@class CITClient;

@interface CITDatabaseView : CITBaseView

- (BOOL)textFieldIsEqualToClientsIdField:(UITextField *)textField;
- (CITClient *)prepareClientObject;

@end
