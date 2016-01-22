//
//  RALoginViewController.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RALoginViewController.h"
#import "RALoginView.h"

@interface RALoginViewController ()

@property (strong, nonatomic) IBOutlet RALoginView *mainView;

@end

@implementation RALoginViewController


#pragma mark - Getters/Setters

- (RALoginView *)mainView
{
    RALoginView *__weak view = (RALoginView *)self.view;
    
    return view;
}


#pragma mark - Actions

- (IBAction)login:(UIButton *)sender {
    
}

@end
