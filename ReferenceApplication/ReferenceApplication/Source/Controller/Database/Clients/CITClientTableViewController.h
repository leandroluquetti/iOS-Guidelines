//
//  CITClientTableViewController.h
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CITClient;

@interface CITClientTableViewController : UITableViewController

- (void)addNewClient:(CITClient *)client;

@end
