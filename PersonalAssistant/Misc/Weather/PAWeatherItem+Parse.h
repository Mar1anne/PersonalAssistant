//
//  PAWeatherItem+Parse.h
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWeatherItem.h"

@interface PAWeatherItem (Parse)

+(PAWeatherItem *)itemFromWeatherDictionary:(NSDictionary *)dict;

@end
