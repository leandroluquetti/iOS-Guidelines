//
//  CITLoginView.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITBaseView.h"

typedef NS_ENUM(NSInteger, RALoginFieldType) {
    RALoginFieldUser,
    RALoginFieldPassword,
    RALoginFieldAll
};

@interface CITLoginView : CITBaseView

- (NSString *)userText;
- (NSString *)passwordText;

- (void)dismissKeyboard;
- (void)showLoadingView:(BOOL)show;
- (void)invalidField:(RALoginFieldType)fieldTye;

@end
