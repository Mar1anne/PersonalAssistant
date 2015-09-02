//
//  PAModalTransitionDelegate.h
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAReversibleTransition.h"

@interface PAModalTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

- (instancetype)initWithReverisbleTransition:(PAReversibleTransition *)transition;

@end
