//
//  PAMenuCellViewFactory.h
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAMenuCellViewFactory : NSObject

+ (NSString *)itemNameForIndex:(NSInteger)index;

+ (UIImage *)itemImageForIndex:(NSInteger)index;

@end
