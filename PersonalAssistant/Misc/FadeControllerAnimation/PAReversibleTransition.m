//
//  PAReversibleTransition.m
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAReversibleTransition.h"

@implementation PAReversibleTransition

- (instancetype)initWithAnimationDuration:(float)duration
{
    self = [super init];
    if (self) {
        _duration = duration;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //Note: child Transitions should override and provide acutal implementation.
}

@end
