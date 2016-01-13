//
//  CITLoginView.h
//  NetworkSample
//
//  Created by Henrique Gouveia on 12/8/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CITLoginView : UIView

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

- (void)dismissKeyboard;

@end
