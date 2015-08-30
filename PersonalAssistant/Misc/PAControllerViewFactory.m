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

- (UIView *)startView
{
    if (!self.startController) {
        self.startController = [[PAStartViewController alloc] init];
    }
    return self.startController.view;
}

- (UIView *)weatherView
{
    if (!self.weatherController) {
        self.weatherController = [[PAWeatherViewController alloc] init];
    }
    return self.weatherController.view;
}

- (UIView *)webViewForKeyword:(NSString *)keyword
{
    if (!self.webController) {
        self.webController = [[PAWebViewController alloc] initWithKeyword:keyword];
    }
    return self.webController.view;
}

- (UIView *)callerViewForContact:(APContact *)contact
{
    if (!self.callController) {
        self.callController = [[PACallContactViewController alloc] initWithContact:contact];
    } else {
        [self.callController updateWithContact:contact];
    }
    
    return self.callController.view;
}

- (UIView *)messageViewForContact:(APContact *)contact
{
    if (!self.smsController) {
        self.smsController = [[PASmsViewController alloc] initWithContact:contact];
    } else {
        [self.smsController updateWithContact:contact];
    }
    
    return self.smsController.view;
}

- (UIView *)emailViewForContact:(APContact *)contact
{
    if (!self.emailController) {
        self.emailController = [[PAEmailViewController alloc] initWithContact:contact];
    } else {
        [self.emailController updateWithContact:contact];
    }
    
    return self.emailController.view;
}

- (UIView *)notesView
{
    if (!self.notesController) {
        self.notesController = [[PANotesViewController alloc] init];
    }
    
    return self.notesController.view;
}

- (UIView *)createRemindersView
{
    if (!self.createRemindersController) {
        self.createRemindersController = [[PACreateRemindersViewController alloc] init];
    }
    return self.createRemindersController.view;
}

@end
