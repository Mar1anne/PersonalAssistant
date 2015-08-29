//
//  PAContactsManager.m
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContactsManager.h"

#define kKeyAllContacts @"kKeyAllContacts"
#define kKeyEmailContacts @"kKeyEmailContacts"
#define kKeyPhoneContacts @"kKeyPhoneContacts"

typedef void(^ContactsCompletionBlock) (NSArray *allContacts, NSArray *emailContacts, NSArray *phoneContacts);

@interface PAContactsManager ()

@property (nonatomic, readwrite) NSMutableArray *emailContacts;
@property (nonatomic, readwrite) NSMutableArray *phoneContacts;
@property (nonatomic, readwrite) NSMutableArray *allContacts;

@end

@implementation PAContactsManager

+ (instancetype)sharedManager
{
    static PAContactsManager *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.allContacts = [NSMutableArray array];
        self.emailContacts = [NSMutableArray array];
        self.phoneContacts = [NSMutableArray array];
        
        [self getAdressBookContacts];
    }
    return self;
}

- (void)getAdressBookContacts
{
    APAddressBook *addressBook = [[APAddressBook alloc] init];
    
    addressBook.fieldsMask = APContactFieldEmails |
                             APContactFieldFirstName |
                             APContactFieldLastName |
                             APContactFieldPhones |
                             APContactFieldPhoto |
                             APContactFieldRecordID |
                             APContactFieldThumbnail;
    
    [addressBook loadContacts:^(NSArray *contacts, NSError *error) {

        if (contacts && !error) {
            [self filterContacts:contacts completion:nil];
        }
    }];
}

#pragma mark - Helper methods

- (void)filterContacts:(NSArray *)contacts completion:(ContactsCompletionBlock)completion
{
    [self.allContacts addObjectsFromArray:contacts];
    
    for (APContact *contact in contacts) {
        if (contact.emails.count > 0) {
            [self.emailContacts addObject:contact];
        }
        if (contact.phones.count > 0) {
            [self.phoneContacts addObject:contact];
        }
    }

    if (completion) {
        completion(self.allContacts, self.emailContacts, self.phoneContacts);
    }
}

@end
