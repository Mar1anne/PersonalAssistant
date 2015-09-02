//
//  PAModalTransitionDelegate.m
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAModalTransitionDelegate.h"

@interface PAModalTransitionDelegate ()

@property (nonatomic, strong) PAReversibleTransition *transition;

@end

@implementation PAModalTransitionDelegate

- (instancetype)initWithReverisbleTransition:(PAReversibleTransition *)transition
{
    self = [super init];
    
    if (self) {
        _transition = transition;
    }
    
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}

@end
