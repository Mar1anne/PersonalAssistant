//
//  PABaseNavigationViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseNavigationViewController.h"

@interface PABaseNavigationViewController ()

@end

@implementation PABaseNavigationViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        [self setupTransitions];
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
        [self setupTransitions];
    }
    
    return self;
}

- (void)setupTransitions
{
    // Child controller should override
}

#pragma mark - Life Cycle

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (self.customNavigationTransition) {
        BOOL isReverse = operation == UINavigationControllerOperationPop;
        self.customNavigationTransition.reverse = isReverse;
        return self.customNavigationTransition;
    }
    
    return nil;
}

#pragma mark - Attribute accessors and getters

- (void)setCustomModalTranstion:(id<UIViewControllerTransitioningDelegate>)customModalTranstion
{
    if (customModalTranstion != _customModalTranstion) {
        _customModalTranstion = customModalTranstion;
    }
    self.transitioningDelegate = _customModalTranstion;
}

@end
