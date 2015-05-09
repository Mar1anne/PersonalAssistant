//
//  PAContainerViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAContainerViewController : UIViewController

@property (nonatomic, strong) NSArray *tabBarItems;
@property (nonatomic, assign, readonly) NSInteger selectedIndex;

- (void)selectViewControllerAtIndex:(NSInteger)index;

@end
