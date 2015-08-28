//
//  PAWeatherItem+Parse.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWeatherItem+Parse.h"

@implementation PAWeatherItem (Parse)

+ (PAWeatherItem *)itemFromWeatherDictionary:(NSDictionary *)dict
{
    PAWeatherItem *item = nil;
    
    item = [[PAWeatherItem alloc] init];
    
    NSDictionary *data = [dict objectForKey:@"data"];
    NSArray *currentConditions = [data objectForKey:@"current_condition"];
    NSDictionary *currentConditionsDict = [currentConditions objectAtIndex:0];
    item.weatherCurrentTemp = [currentConditionsDict objectForKey:@"temp_F"];
    item.weatherCode = [currentConditionsDict objectForKey:@"weatherCode"];
    item.weatherPrecipitationAmount = [currentConditionsDict objectForKey:@"precipMM"];
    item.weatherHumidity = [currentConditionsDict objectForKey:@"humidity"];
    item.weatherWindSpeed = [currentConditionsDict objectForKey:@"windspeedMiles"];
    item.weatherCurrentTempImage = [self imageForWeatherCode:item.weatherCode];
    
    NSDictionary *forecast = [data objectForKey:@"weather"];
    
    NSMutableArray *mutableForecastArray = [NSMutableArray array];
    NSMutableArray *mutableForecastDescriptionArray = [NSMutableArray array];
    NSMutableArray *mutableForecasttDescriptionImages = [NSMutableArray array];
    NSMutableArray *mutableNextDaysArray = [NSMutableArray array];
    
    NSInteger i = 0;
    
    for (NSDictionary *dict in forecast) {
        NSString *day = [self dayNameFromDateString:[dict objectForKey:@"date"]];
        [mutableNextDaysArray insertObject:day atIndex:i];
        
        NSString *dayTemp = [dict objectForKey:@"tempMaxF"];
        NSArray *descriptionArray = [dict objectForKey:@"weatherDesc"];
        
        NSString *weatherCode = [dict objectForKey:@"weatherCode"];
        UIImage *image = [self imageForWeatherCode:weatherCode];
        
        NSDictionary *descriptionDict = [descriptionArray objectAtIndex:0];
        NSString *dayDescription = [descriptionDict objectForKey:@"value"];
        
        [mutableForecastArray insertObject:dayTemp atIndex:i];
        [mutableForecastDescriptionArray insertObject:dayDescription atIndex:i];
        [mutableForecasttDescriptionImages insertObject:image atIndex:i];
        NSLog(@"setting object %@ for key %@", dayTemp, day);
        
        i++;
    }
    item.weatherForecast = (NSArray *)mutableForecastArray;
    item.weatherForecastConditions = (NSArray *)mutableForecastDescriptionArray;
    item.weatherForecastConditionsImages = (NSArray *)mutableForecasttDescriptionImages;
    item.nextDays = (NSArray *)mutableNextDaysArray;
    
    NSLog (@"%@, %@, %@, %@", item.weatherForecast, item.weatherForecastConditionsImages, item.weatherForecastConditions, item.nextDays);
    
    item.indexForWeatherMap = [self indexForTemperature:item.weatherCurrentTemp];
    return item;
}

+ (NSString *)dayNameFromDateString:(NSString *)dateString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:dateString];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comp = [cal components:NSWeekdayCalendarUnit fromDate:date];
    
    if (comp.weekday ==1) {
        return @"Mon";
    } else if (comp.weekday ==2) {
        return @"Tue";
    } else if (comp.weekday ==3) {
        return @"Wed";
    } else if (comp.weekday ==4) {
        return @"Thu";
    } else if (comp.weekday ==5) {
        return @"Fri";
    } else if (comp.weekday ==6) {
        return @"Sat";
    } else if (comp.weekday ==7) {
        return @"Sun";
    }
    return nil;
}


+ (int)indexForTemperature:(NSString *)temp
{
    int temperatureInt = temp.intValue;
    
    if (temperatureInt <=8 && temperatureInt >=0) {
        return 12;
    } else if (temperatureInt <=17 && temperatureInt >=9) {
        return 11;
    } else if (temperatureInt <=26 && temperatureInt >=18) {
        return 10;
    } else if (temperatureInt <=35 && temperatureInt >=27) {
        return 9;
    } else if (temperatureInt <=44 && temperatureInt >=36) {
        return 8;
    } else if (temperatureInt <=53 && temperatureInt >=45) {
        return 7;
    } else if (temperatureInt <=62 && temperatureInt >=54) {
        return 6;
    } else if (temperatureInt <=71 && temperatureInt >=63) {
        return 5;
    } else if (temperatureInt <=80 && temperatureInt >=72) {
        return 4;
    } else if (temperatureInt <=89 && temperatureInt >=81) {
        return 3;
    } else if (temperatureInt <=97 && temperatureInt >=90) {
        return 2;
    } else if (temperatureInt <=100 && temperatureInt >=98) {
        return 1;
    } else if (temperatureInt <=200 && temperatureInt >=101) {
        return 0;
    }
    return 0;
}

+ (NSString *)descriptionOfWeatherFromWeatherCode:(NSString *)weatherCode
{
    NSString *weatherDescription;
    
    switch (weatherCode.intValue) {
        case 113:
            weatherDescription = @"Clear/Sunny";
            break;
        case 116:
            weatherDescription = @"Partly Cloudy";
            break;
        case 119:
            weatherDescription = @"Cloudy";
            break;
        case 122:
            weatherDescription = @"Overcast";
            break;
        case 143:
            weatherDescription = @"Mist";
            break;
        case 176:
            weatherDescription = @"Patchy rain nearby";
            break;
        case 179:
            weatherDescription = @"Patchy snow nearby";
            break;
        case 182:
            weatherDescription = @"Patchy sleet nearby";
            break;
        case 185:
            weatherDescription = @"Patchy freezing drizzle nearby";
            break;
        case 200:
            weatherDescription = @"Thundery outbreaks in nearby";
            break;
        case 227:
            weatherDescription = @"Blowing snow";
            break;
        case 230:
            weatherDescription = @"Blizzard";
            break;
        case 248:
            weatherDescription = @"Fog";
            break;
        case 260:
            weatherDescription = @"Freezing fog";
            break;
        case 263:
            weatherDescription = @"Patchy light drizzle";
            break;
        case 266:
            weatherDescription = @"Light drizzle";
            break;
        case 281:
            weatherDescription = @"Freezing drizzle";
            break;
        case 284:
            weatherDescription = @"Heavy freezing drizzle";
            break;
        case 293:
            weatherDescription = @"Patchy light rain";
            break;
        case 296:
            weatherDescription = @"Light rain";
            break;
        case 299:
            weatherDescription = @"Moderate rain at times";
            break;
        case 302:
            weatherDescription = @"Moderate rain";
            break;
        case 305:
            weatherDescription = @"Heavy rain at times";
            break;
        case 308:
            weatherDescription = @"Heavy rain";
            break;
        case 311:
            weatherDescription = @"Light freezing rain";
            break;
        case 314:
            weatherDescription = @"Moderate or Heavy freezing rain";
            break;
        case 317:
            weatherDescription = @"Light sleet";
            break;
        case 320:
            weatherDescription = @"Moderate or heavy sleet";
            break;
        case 323:
            weatherDescription = @"Patchy light snow";
            break;
        case 326:
            weatherDescription = @"Light snow";
            break;
        case 329:
            weatherDescription = @"Patchy moderate snow";
            break;
        case 332:
            weatherDescription = @"Moderate snow";
            break;
        case 335:
            weatherDescription = @"Patchy heavy snow";
            break;
        case 338:
            weatherDescription = @"Heavy snow";
            break;
        case 350:
            weatherDescription = @"Ice pellets";
            break;
        case 353:
            weatherDescription = @"Light rain shower";
            break;
        case 356:
            weatherDescription = @"Moderate or heavy rain shower";
            break;
        case 359:
            weatherDescription = @"Torrential rain shower";
            break;
        case 362:
            weatherDescription = @"Light sleet showers";
            break;
        case 365:
            weatherDescription = @"Moderate or heavy sleet showers";
            break;
        case 368:
            weatherDescription = @"Light snow showers";
            break;
        case 371:
            weatherDescription = @"Moderate or heavy snow showers";
            break;
        case 374:
            weatherDescription = @"Light showers of ice pellets";
            break;
        case 377:
            weatherDescription = @"Moderate or heavy showers of ice pellets";
            break;
        case 386:
            weatherDescription = @"Patchy light rain in area with thunder";
            break;
        case 389:
            weatherDescription = @"Moderate or heavy rain in area with thunder";
            break;
        case 392:
            weatherDescription = @"Patchy light snow in area with thunder";
            break;
        case 395:
            weatherDescription = @"Moderate or heavy snow in area with thunder";
            break;
        default:
            break;
    }
    return weatherDescription;
}

+ (UIImage *)imageForWeatherCode:(NSString *)weatherCode
{
    UIImage *weatherImage = [[UIImage alloc] init];
    
    switch (weatherCode.intValue) {
        case 113:
            weatherImage = [UIImage imageNamed:@"sun"];
            break;
        case 116:
        case 119:
        case 122:
            weatherImage = [UIImage imageNamed:@"cloud"];
            break;
            
        case 143:
        case 248:
        case 260:
            weatherImage = [UIImage imageNamed:@"fog"];
            break;

        case 176:
        case 185:
        case 263:
        case 266:
        case 281:
        case 284:
            weatherImage = [UIImage imageNamed:@"drizzle"];
            break;
            
        case 182:
        case 317:
        case 320:
            weatherImage = [UIImage imageNamed:@"hail"];
            break;
        
        case 230:
        case 323:
        case 326:
        case 329:
            weatherImage = [UIImage imageNamed:@"snowAlt"];
            break;
            
        case 293:
        case 296:
        case 299:
        case 302:
        case 305:
        case 308:
        case 311:
        case 314:
        case 353:
        case 356:
        case 359:
        case 362:
        case 365:
            weatherImage = [UIImage imageNamed:@"rain"];
            break;
            
        case 179:
        case 227:
        case 332:
        case 335:
        case 338:
        case 350:
        case 368:
        case 371:
        case 374:
        case 377:
            weatherImage = [UIImage imageNamed:@"snow"];
            break;
            
        case 200:
        case 386:
        case 389:
        case 392:
        case 395:
            weatherImage = [UIImage imageNamed:@"lightning"];
            break;

        default:
            break;
    }
    return weatherImage;
}

@end
