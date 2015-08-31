//
//  PAControllerViewFactory.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAControllerViewFactory.h"
#import "PAWeatherViewController.h"
#import "PAStartViewController.h"
#import "PAWebViewController.h"
#import "PACallContactViewController.h"
#import "PASmsViewController.h"
#import "PAEmailViewController.h"
#import "PACreateRemindersViewController.h"
#import "PAContactListViewController.h"
#import "PARemindersViewController.h"

@interface PAControllerViewFactory ()

@property (nonatomic, strong) PAStartViewController *startController;
@property (nonatomic, strong) PAWeatherViewController *weatherController;
@property (nonatomic, strong) PAWebViewController *webController;
@property (nonatomic, strong) PACallContactViewController *callController;
@property (nonatomic, strong) PASmsViewController *smsController;
@property (nonatomic, strong) PAEmailViewController *emailController;
@property (nonatomic, strong) PACreateRemindersViewController *createRemindersController;
@property (nonatomic, strong) PAContactListViewController *contactListController;
@property (nonatomic, strong) PARemindersViewController *remindersListController;

@end

@implementation PAControllerViewFactory

+ (instancetype)sharedFactory
{
    static PAControllerViewFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[self alloc] init];
    });
    
    return factory;
}

- (UIView *)startViewForParentController:(PAMainContainerViewController *)parentController
{
    if (!self.startController) {
        self.startController = [[PAStartViewController alloc] init];
    }
    self.startController.containerController = parentController;

    return self.startController.view;
}

- (UIView *)weatherViewForParentController:(PAMainContainerViewController *)parentController
{
    if (!self.weatherController) {
        self.weatherController = [[PAWeatherViewController alloc] init];
    }
    self.weatherController.containerController = parentController;

    return self.weatherController.view;
}

- (UIView *)webViewForKeyword:(NSString *)keyword parentController:(PAMainContainerViewController *)parentController
{
    if (!self.webController) {
        self.webController = [[PAWebViewController alloc] initWithKeyword:keyword];
    } else {
        self.webController.keyword =  keyword;
    }
    self.webController.containerController = parentController;
    
    return self.webController.view;
}

- (UIView *)callerViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController
{
    if (!self.callController) {
        self.callController = [[PACallContactViewController alloc] initWithContact:contact];
    } else {
        [self.callController updateWithContact:contact];
    }
    self.callController.containerController = parentController;

    return self.callController.view;
}

- (UIView *)messageViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController
{
    if (!self.smsController) {
        self.smsController = [[PASmsViewController alloc] initWithContact:contact];
    } else {
        [self.smsController updateWithContact:contact];
    }
    self.smsController.containerController = parentController;

    return self.smsController.view;
}

- (UIView *)emailViewForContact:(APContact *)contact parentController:(PAMainContainerViewController *)parentController
{
    if (!self.emailController) {
        self.emailController = [[PAEmailViewController alloc] initWithContact:contact];
    } else {
        [self.emailController updateWithContact:contact];
    }
    self.emailController.containerController = parentController;

    return self.emailController.view;
}

- (UIView *)createRemindersViewForParentController:(PAMainContainerViewController *)parentController
{
    if (!self.createRemindersController) {
        self.createRemindersController = [[PACreateRemindersViewController alloc] init];
    }
    self.createRemindersController.containerController = parentController;

    return self.createRemindersController.view;
}

- (UIView *)contactListForType:(PAContactsListType)type parentController:(PAMainContainerViewController *)parentController
{
    if (!self.contactListController) {
        self.contactListController = [[PAContactListViewController alloc] initWithType:type];
    } else {
        self.contactListController.type = type;
    }
    self.contactListController.containerController = parentController;
    
    return self.contactListController.view;
}

- (UIView *)remindersListViewForParentController:(PAMainContainerViewController *)parentController
{
    if (!self.remindersListController) {
        self.remindersListController = [[PARemindersViewController alloc] init];
    }
    self.remindersListController.containerController = parentController;
    return self.remindersListController.view;
}

- (UIView *)viewForSelectedMenuIndex:(NSInteger)index parentController:(PAMainContainerViewController *)parentController
{
    switch (index) {
        case 0:
            return [self contactListForType:PAContactsListTypeSMS parentController:parentController];
            break;
        case 1:
            return [self contactListForType:PAContactsListTypeCall parentController:parentController];
            break;
        case 2:
            return [self contactListForType:PAContactsListTypeEmail parentController:parentController];
            break;
        case 3:
            return [self weatherViewForParentController:parentController];
            break;
        case 4:
            return [self remindersListViewForParentController:parentController];
            break;
        case 5:
            return [self webViewForKeyword:nil parentController:parentController];
            break;
        default:
            return [self webViewForKeyword:nil parentController:parentController];
            break;
    }
}

@end
