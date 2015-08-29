//
//  PAControllerViewFactory.h
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAControllerViewFactory : NSObject

+ (UIView *)startView;

+ (UIView *)weatherView;

+ (UIView *)webViewForKeyword:(NSString *)keyword;

@end
