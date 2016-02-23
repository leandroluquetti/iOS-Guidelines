//
//  RADatabaseViewController.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RADatabaseViewController.h"
#import "RADatabaseView.h"
#import "RAClientTableViewController.h"
#import "CITDataAccess+Client.h"
#import "RAClient.h"

@interface RADatabaseViewController ()

@property (weak, nonatomic) RAClientTableViewController *clientsTableViewController;
@property (readonly, nonatomic) RADatabaseView *mainView;

@end

@implementation RADatabaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kClientTableViewControllerContainerSegue]) {
        self.clientsTableViewController = segue.destinationViewController;
    }
}


#pragma mark - Actions

- (IBAction)addClient:(id)sender {
    
    RAClient *client = [self.mainView prepareClientObject];
    typeof(self) __weak __block weakSelf = self;
    [CITDataAccess insertRow:client withCompletionBlock:^(BOOL success) {
        [weakSelf.clientsTableViewController addNewClient:client];
    }];
}


#pragma mark - TextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL shouldChange = NO;
    
    NSCharacterSet *nonNumberSet = nil;
    
    if ([self.mainView textFieldIsEqualToClientsIdField:textField]) {
        nonNumberSet = [NSCharacterSet decimalDigitCharacterSet];
    } else {
        nonNumberSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    }
    
    shouldChange = ([string stringByTrimmingCharactersInSet:nonNumberSet].length == 0) || [string isEqualToString:@""];
    
    return shouldChange;
}


#pragma mark - Getters/Setters

- (RADatabaseView *)mainView {
    return (RADatabaseView *)self.view;
}

@end
