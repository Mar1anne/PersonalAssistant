//
//  PATabBar.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PATabBar : UIView

@property (nonatomic, strong) NSMutableArray *tabBarButtons;

- (NSArray *)arrangeButtonsForItems:(NSArray*)items;
- (void)selectButtonAtIndex:(NSInteger)index;

@end
