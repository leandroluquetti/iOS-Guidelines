//
//  RADatabaseView.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseView.h"

@class RAClient;

@interface RADatabaseView : CITBaseView

- (BOOL)textFieldIsEqualToClientsIdField:(UITextField *)textField;
- (RAClient *)prepareClientObject;

@end
