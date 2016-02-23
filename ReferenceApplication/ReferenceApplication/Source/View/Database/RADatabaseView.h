//
//  RADatabaseView.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RABaseView.h"

@class RAClient;

@interface RADatabaseView : RABaseView

- (BOOL)textFieldIsEqualToClientsIdField:(UITextField *)textField;
- (RAClient *)prepareClientObject;

@end
