//
//  CITDatabaseViewController.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITDatabaseViewController.h"
#import "CITDatabaseExampleManager.h"
#import "CITDatabaseView.h"
#import "CITClientTableViewController.h"
#import "CITDataAccess+Client.h"
#import "CITClient.h"

@interface CITDatabaseViewController ()

@property (weak, nonatomic) CITClientTableViewController *clientsTableViewController;
@property (readonly, nonatomic) CITDatabaseView *mainView;
@property (strong, nonatomic) CITDatabaseExampleManager *manager;

@end

@implementation CITDatabaseViewController

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
    
    CITClient *client = [self.mainView prepareClientObject];
    if (!client) {
        [self showFillAlert];
    } else {
    
        typeof(self) __weak __block weakSelf = self;
        
        [self.manager insertClient:client withCompletionBlock:^(BOOL success) {
            
            if (success) {
                [weakSelf.clientsTableViewController addNewClient:client];
            }
        }];
    }
}

- (void)showFillAlert {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"databaseExample.alert.title", @"OOPS")
                                                                   message:NSLocalizedString(@"databaseExample.alert.message", @"Please, fill in all fields.")
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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

- (CITDatabaseView *)mainView {
    return (CITDatabaseView *)self.view;
}

- (CITDatabaseExampleManager *)manager {
    if (!_manager) {
        _manager = [CITDatabaseExampleManager new];
    }
    
    return _manager;
}

@end
