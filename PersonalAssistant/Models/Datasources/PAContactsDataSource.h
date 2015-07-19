//
//  PAContactsDataSource.h
//  PersonalAssistant
//
//  Created by Mariana on 7/19/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

typedef void(^SuccessCompletionBlock) (BOOL success);

@interface PAContactsDataSource : NSObject

@property (nonatomic, readonly) NSMutableArray *contacts;

- (void)fetchContacts:(SuccessCompletionBlock)success;

@end
