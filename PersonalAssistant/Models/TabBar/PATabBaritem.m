//
//  PATabBaritem.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PATabBaritem.h"

@implementation PATabBaritem

- (id)init
{
    self = [super init];
    if (self) {
        self.defaultBackgroundColor = [UIColor clearColor];
        self.selectedBackgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
