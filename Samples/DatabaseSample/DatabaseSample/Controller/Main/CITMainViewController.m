//
//  CITMainViewController.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITMainViewController.h"
#import "CITClientsTableViewController.h"
#import "CITDataAccess+Client.h"
#import "CITMainView.h"

@interface CITMainViewController () <UITextFieldDelegate>

@property (weak, nonatomic) CITClientsTableViewController *clientsTableViewController;
@property (readonly, nonatomic) CITMainView *mainView;

@end

@implementation CITMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.clientsTableViewController = segue.destinationViewController;
}

#pragma mark - Actions

- (IBAction)addClient:(id)sender {
    
    Client *client = [self.mainView prepareClientObject];
    typeof(self) __weak __block weakSelf = self;
    [CITDataAccess insertRow:client withCompletionBlock:^(BOOL success) {
        [weakSelf.clientsTableViewController addANewClient:client];
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

- (CITMainView *)mainView {
    return (CITMainView *)self.view;
}

@end
