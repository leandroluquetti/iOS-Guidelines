//
//  RACustomStoryboardSegue.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

/**
 *  Class responsible to control application flow and transition.
 *  We shouldn't import ViewControllers inside ViewControllers unless if it be part of their responsability.
 *  Should be create one UIStoryboardSegue subclass for each Storyboard
 */

#import "RACustomStoryboardSegue.h"

/*
 View Controllers
 */
#import "RALoginViewController.h"
#import "RAWelcomeViewController.h"


@implementation RACustomStoryboardSegue

- (void)perform {
    if ([self.identifier isEqualToString:kFromLoginViewToWelcomeViewSegue]) {
        [self perfomrSegueFromLoginViewToWelcomeView];
    }
}

/**
 *  Transition between Login and Welcome view. 
 *  All data requied for this transition should be keep inside this method
 */
- (void)perfomrSegueFromLoginViewToWelcomeView {
    RALoginViewController *loginViewController = (RALoginViewController *)self.sourceViewController;
    RAWelcomeViewController *welcomeViewController = (RAWelcomeViewController *)self.destinationViewController;
    
    welcomeViewController.user = [loginViewController currentUser];
    [self.sourceViewController presentViewController:welcomeViewController animated:YES completion:nil];
}

@end
