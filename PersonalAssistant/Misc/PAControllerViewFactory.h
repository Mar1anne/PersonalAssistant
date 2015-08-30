//
//  PAControllerViewFactory.h
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAControllerViewFactory : NSObject

+ (instancetype)sharedFactory;

- (UIView *)startViewForParentController:(UIViewController *)parentController;

- (UIView *)weatherViewForParentController:(UIViewController *)parentController;

- (UIView *)webViewForKeyword:(NSString *)keyword parentController:(UIViewController *)parentController;

- (UIView *)callerViewForContact:(APContact *)contact parentController:(UIViewController *)parentController;

- (UIView *)messageViewForContact:(APContact *)contact parentController:(UIViewController *)parentController;

- (UIView *)emailViewForContact:(APContact *)contact parentController:(UIViewController *)parentController;

- (UIView *)notesViewForParentController:(UIViewController *)parentController;

- (UIView *)createRemindersViewForParentController:(UIViewController *)parentController;

- (UIView *)viewForSelectedMenuIndex:(NSInteger)index parentController:(UIViewController *)parentController;

@end
