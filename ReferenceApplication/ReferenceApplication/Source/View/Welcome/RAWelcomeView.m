//
//  RAWelcomeView.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAWelcomeView.h"

@interface RAWelcomeView()

@property (weak, nonatomic) IBOutlet UILabel *loginSuccessLabel;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;

@end


@implementation RAWelcomeView


#pragma mark - Override

- (void)awakeFromNib {
    self.loginSuccessLabel.text = NSLocalizedString(@"welcomeScreen.label.successful", @"Successful message");
}


#pragma mark - Update UI Components

- (void)showWelcomeMessageWithName:(NSString *)name {
    self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"welcomeScreen.label.welcome", @"Welcome message"), name];
}

@end
