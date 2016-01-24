//
//  RAWelcomeViewController.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RAWelcomeViewController.h"
#import "RAWelcomeView.h"

@interface RAWelcomeViewController()

@property (strong, nonatomic) IBOutlet RAWelcomeView *mainView;

@end

@implementation RAWelcomeViewController

#pragma mark - Override

-(void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Getters/Setters

- (RAWelcomeView *)mainView {
    RAWelcomeView *__weak view = (RAWelcomeView *)self.view;
    
    return view;
}

@end
