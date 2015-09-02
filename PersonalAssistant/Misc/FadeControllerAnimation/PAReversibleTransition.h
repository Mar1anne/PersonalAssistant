//
//  PAReversibleTransition.h
//  PersonalAssistant
//
//  Created by Mariana on 9/2/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PAReversibleTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, getter=isReverse) BOOL reverse;

@property (nonatomic) float duration;

- (instancetype)initWithAnimationDuration:(float)duration;

@end
