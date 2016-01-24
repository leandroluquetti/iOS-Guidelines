//
//  RACustomStoryboardSegue.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RACustomStoryboardSegue.h"

/*View Controllers*/
#import "RALoginViewController.h"
#import "RAWelcomeViewController.h"

@implementation RACustomStoryboardSegue

- (void)perform {
    if ([self.identifier isEqualToString:kFromLoginViewToWelcomeViewSegue]) {
        [self perfomrSegueFromLoginViewToWelcomeView];
    }
}

- (void)perfomrSegueFromLoginViewToWelcomeView {
    RAWelcomeViewController *welcomeViewController = (RAWelcomeViewController *)self.destinationViewController;
    
    [self.sourceViewController presentViewController:welcomeViewController animated:YES completion:nil];
}

@end
