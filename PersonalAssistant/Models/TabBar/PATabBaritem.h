//
//  PATabBaritem.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PATabBaritem : NSObject

/**
 * The ViewController connected to the tab bar item
 */
@property (nonatomic, strong) UIViewController *viewController;

/**
 * The image displayed in the tabbar when the item is not selected
 */
@property (nonatomic, strong) UIImage *defaultImage;

/**
 * The image displayed in the tabbar when the item is selected
 */
@property (nonatomic, strong) UIImage *selectedImage;

/**
 * The image displayed in the tabbar when the item is highlighted
 */
@property (nonatomic, strong) UIImage *highlightedImage;

/**
 * The background color displayed in the tabbar when the item is not selected
 */
@property (nonatomic, strong) UIColor *defaultBackgroundColor;

/**
 * The background color in the tabbar when the item is selected
 */
@property (nonatomic, strong) UIColor *selectedBackgroundColor;

@end
