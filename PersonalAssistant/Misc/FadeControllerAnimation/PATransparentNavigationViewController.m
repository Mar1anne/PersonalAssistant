//
//  PATransparentNavigationViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PATransparentNavigationViewController.h"
#import "PAFadeTransition.h"
#import "PAModalTransitionDelegate.h"

@interface PATransparentNavigationViewController ()

@end

@implementation PATransparentNavigationViewController

- (void)setupTransitions
{
    // Modal transition
    PAFadeTransition *modalTransition = [[PAFadeTransition alloc] initWithAnimationDuration:0.28];
    PAModalTransitionDelegate *modalTransiotionDelegate = [[PAModalTransitionDelegate alloc] initWithReverisbleTransition:modalTransition];
    self.customModalTranstion = modalTransiotionDelegate;
    
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
}

@end
