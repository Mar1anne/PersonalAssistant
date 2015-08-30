//
//  PAControllerViewFactory.h
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAMainContainerViewController.h"

@interface PAControllerViewFactory : NSObject

+ (instancetype)sharedFactory;

- (UIView *)startViewForParentController:(PAMainContainerViewController *)parentController;

- (UIView *)weatherViewForParentController:(PAMainContainerViewController *)parentController;

- (UIView *)webViewForKeyword:(NSString *)keyword parentController:(PAMainContainerViewController *)parentController;

- (UIView *)callerViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController;

- (UIView *)messageViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController;

- (UIView *)emailViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController;

- (UIView *)notesViewForParentController:(PAMainContainerViewController *)parentController;

- (UIView *)createRemindersViewForParentController:(PAMainContainerViewController *)parentController;

- (UIView *)viewForSelectedMenuIndex:(NSInteger)index parentController:(PAMainContainerViewController *)parentController;

@end
