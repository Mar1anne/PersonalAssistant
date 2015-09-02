//
//  PABaseNavigationViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAReversibleTransition.h"

@interface PABaseNavigationViewController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic, strong) id<UIViewControllerTransitioningDelegate> customModalTranstion;
@property (nonatomic, strong) PAReversibleTransition *customNavigationTransition;

- (void)setupTransitions;

@end
