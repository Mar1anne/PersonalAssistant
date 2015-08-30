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
#import "PANotesViewController.h"
#import "PACreateRemindersViewController.h"

@interface PAControllerViewFactory ()

@property (nonatomic, strong) PAStartViewController *startController;
@property (nonatomic, strong) PAWeatherViewController *weatherController;
@property (nonatomic, strong) PAWebViewController *webController;
@property (nonatomic, strong) PACallContactViewController *callController;
@property (nonatomic, strong) PASmsViewController *smsController;
@property (nonatomic, strong) PAEmailViewController *emailController;
@property (nonatomic, strong) PANotesViewController *notesController;
@property (nonatomic, strong) PACreateRemindersViewController *createRemindersController;

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

- (UIView *)startViewForParentController:(UIViewController *)parentController
{
    if (!self.startController) {
        self.startController = [[PAStartViewController alloc] init];
        self.startController.containerController = parentController;
    }
    
    return self.startController.view;
}

- (UIView *)weatherViewForParentController:(UIViewController *)parentController
{
    if (!self.weatherController) {
        self.weatherController = [[PAWeatherViewController alloc] init];
        self.weatherController.containerController = parentController;
    }
    
    return self.weatherController.view;
}

- (UIView *)webViewForKeyword:(NSString *)keyword
{
    if (!self.webController) {
        self.webController = [[PAWebViewController alloc] initWithKeyword:keyword];
    } else {
        self.webController.keyword =  keyword;
    }
    
    return self.webController.view;
}

- (UIView *)callerViewForContact:(APContact *)contact parentController:(UIViewController *)parentController
{
    if (!self.callController) {
        self.callController = [[PACallContactViewController alloc] initWithContact:contact];
        self.callController.containerController = parentController;
    } else {
        [self.callController updateWithContact:contact];
    }
    
    return self.callController.view;
}

- (UIView *)messageViewForContact:(APContact *)contact parentController:(UIViewController *)parentController
{
    if (!self.smsController) {
        self.smsController = [[PASmsViewController alloc] initWithContact:contact];
        self.smsController.containerController = parentController;
    } else {
        [self.smsController updateWithContact:contact];
    }
    
    return self.smsController.view;
}

- (UIView *)emailViewForContact:(APContact *)contact parentController:(UIViewController *)parentController
{
    if (!self.emailController) {
        self.emailController = [[PAEmailViewController alloc] initWithContact:contact];
        self.emailController.containerController = parentController;
    } else {
        [self.emailController updateWithContact:contact];
    }
    
    return self.emailController.view;
}

- (UIView *)notesViewForParentController:(UIViewController *)parentController
{
    if (!self.notesController) {
        self.notesController = [[PANotesViewController alloc] init];
        self.notesController.containerController = parentController;
    }
    
    return self.notesController.view;
}

- (UIView *)createRemindersViewForParentController:(UIViewController *)parentController
{
    if (!self.createRemindersController) {
        self.createRemindersController = [[PACreateRemindersViewController alloc] init];
        self.createRemindersController.containerController = parentController;
    }
    
    return self.createRemindersController.view;
}

- (UIView *)viewForSelectedMenuIndex:(NSInteger)index parentController:(UIViewController *)parentController
{
    switch (index) {
        case 3:
            return [self weatherViewForParentController:parentController];
            break;
        case 5:
            return [self webViewForKeyword:nil];
            break;
        default:
            return [self webViewForKeyword:nil];
            break;
    }
}

@end
