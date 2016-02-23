//
//  RAWelcomeViewController.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITWelcomeViewController.h"
#import "CITWelcomeView.h"

@interface CITWelcomeViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet CITWelcomeView *mainView;
@property (strong, nonatomic) NSArray *dataSource;

@end


@implementation CITWelcomeViewController

static NSString * const kWelcomeTableViewReusableIdentifier = @"welcomeTableViewReusableIdentifier";

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *name = self.user.name;
    [self.mainView showWelcomeMessageWithName:name];
    
    self.dataSource = @[NSLocalizedString(@"welcomeScreen.item.database", @"Database example")];
}


#pragma mark - Getters/Setters

- (CITWelcomeView *)mainView {
    CITWelcomeView *__weak view = (CITWelcomeView *)self.view;
    
    return view;
}


#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWelcomeTableViewReusableIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWelcomeTableViewReusableIdentifier];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:kFromWelcomeViewToDatabaseViewSegue sender:self];
            break;
        default:
            break;
    }
}

@end
