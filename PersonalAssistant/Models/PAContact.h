//
//  PAContact.h
//  PersonalAssistant
//
//  Created by Mariana on 7/19/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAContact : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong, getter=fullName) NSString *fullName;
@property (nonatomic, strong) NSString *homeEmail;
@property (nonatomic, strong) NSString *workEmail;

- (NSString *)fullName;

@end
