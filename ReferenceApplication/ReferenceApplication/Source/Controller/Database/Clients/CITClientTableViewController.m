//
//  RAClientTableViewController.m
//  ReferenceApplication
//
//  Created by SwatTeam on 2/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITClientTableViewController.h"
#import "CITDataAccess+Client.h"
#import "RAClient.h"

@interface CITClientTableViewController ()

@property (nonatomic, strong) NSMutableArray *clients;

@end

@implementation CITClientTableViewController

static NSString * const kClientTableViewReusableIdentifier = @"clientTableViewReusableIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeof(self) __weak __block weakSelf = self;
    
    [CITDataAccess getAllWithCompletionBlock:^(NSArray *result) {
        weakSelf.clients = [NSMutableArray arrayWithArray:result];
        [weakSelf.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.clients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RAClient *client = self.clients[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kClientTableViewReusableIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kClientTableViewReusableIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", client.firstName, client.surname];
    
    return cell;
}

#pragma mark - Own methods

- (void)addNewClient:(RAClient *)client {
    [self.clients insertObject:client atIndex:0];
    [self.tableView reloadData];
}

@end
