//
//  PAFadeTransition.m
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAFadeTransition.h"

@implementation PAFadeTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView;
    UIView *toView;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
    
    if (!self.isReverse) {
        [[transitionContext containerView] addSubview:fromView];
        [[transitionContext containerView] addSubview:toView];
        fromView.alpha = 1.f;
        toView.alpha = 0.f;
    } else {
        [[transitionContext containerView] addSubview:toView];
        [[transitionContext containerView] addSubview:fromView];
        fromView.alpha = 1.f;
        toView.alpha = 1.f;
    }
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        if (!self.isReverse) {
            toView.alpha = 1.f;
        } else {
            fromView.alpha = 0.f;
        }
    } completion:^(BOOL finished) {
        fromView.alpha = 1.0;
        toView.alpha = 1.0;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}

@end
