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

#import "CITCustomStoryboardSegue.h"

/*
 View Controllers
 */
#import "CITLoginViewController.h"
#import "CITWelcomeViewController.h"


@implementation CITCustomStoryboardSegue

- (void)perform {
    if ([self.identifier isEqualToString:kFromLoginViewToWelcomeViewSegue]) {
        [self performSegueFromLoginViewToWelcomeView];
    } else if ([self.identifier isEqualToString:kFromWelcomeViewToDatabaseViewSegue]) {
        [self performSegueFromWelcomeViewToDatabaseView];
    }
}

/**
 *  Transition between Login and Welcome view. 
 *  All data requied for this transition should be keep inside this method
 */
- (void)performSegueFromLoginViewToWelcomeView {
    CITLoginViewController *loginViewController = (CITLoginViewController *)self.sourceViewController;
    UINavigationController *navigationController = (UINavigationController *)self.destinationViewController;
    CITWelcomeViewController *welcomeViewController = (CITWelcomeViewController *)navigationController.viewControllers[0];
    
    
    welcomeViewController.user = [loginViewController currentUser];
    [self.sourceViewController presentViewController:navigationController animated:YES completion:nil];
}

/**
 *  Transition between Welcome and Database view.
 *  All data requied for this transition should be keep inside this method
 */
- (void)performSegueFromWelcomeViewToDatabaseView {
    UIViewController *databaseViewController = (UIViewController *)self.destinationViewController;
    
    [self.sourceViewController.navigationController pushViewController:databaseViewController animated:YES];
}

@end
