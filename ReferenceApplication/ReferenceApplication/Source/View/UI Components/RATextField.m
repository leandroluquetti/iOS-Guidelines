//
//  RATextField.m
//  ReferenceApplication
//
//  Created by SalmoJunior on 1/23/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "RATextField.h"
#import "UIView+Shake.h"

@implementation RATextField

- (void)invalidate {
    self.text = @"";
    [self shake];
}

- (void)shake {
    [self shake:7 withDelta:5 speed:0.06f];
}

- (NSString *)textWithoutSpace {
    NSString *text = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return text;
}

@end
