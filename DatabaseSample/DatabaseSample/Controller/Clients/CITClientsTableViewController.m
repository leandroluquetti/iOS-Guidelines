//
//  CITClientsTableViewController.m
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import "CITClientsTableViewController.h"
#import "Client.h"

#import "CITDataAccess+Client.h"

@interface CITClientsTableViewController ()

@property (nonatomic, strong) NSMutableArray *clients;

@end

@implementation CITClientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeof(self) __weak __block weakSelf = self;
    
    [CITDataAccess getAllWithCompletionBlock:^(NSArray *result) {
        weakSelf.clients = [NSMutableArray arrayWithArray:result];
        [weakSelf.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.clients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Client *client = [self.clients objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CITClientCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CITClientCell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", client.firstName, client.surname];
    
    return cell;
}

#pragma mark - Own methods

- (void)addANewClient:(Client *)client {
    [self.clients insertObject:client atIndex:0];
    [self.tableView reloadData];
}

@end
