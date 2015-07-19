//
//  PAContactsDataSource.m
//  PersonalAssistant
//
//  Created by Mariana on 7/19/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContactsDataSource.h"
#import "PAContact.h"

@interface PAContactsDataSource ()

@property (nonatomic, readwrite) NSMutableArray *contacts;

@end

@implementation PAContactsDataSource

- (void)fetchContacts:(SuccessCompletionBlock)success
{
    // In case of an error we create an error object.
    CFErrorRef error = NULL;
    
    // We get a reference to the user's address book.
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, &error);
    
    if (addressBookRef !=  nil) {

        // Success! Copy all contacts from the addressbook in an array.
        [MBProgressHUD showHUDAddedTo:[PAControllerManager mainWindow] animated:YES];
        
        NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
        
        // Loop through the contacts in the address book. For each contact, create a PAContact Object.
        
        for (int i = 0; i < allContacts.count; i++) {
            
            PAContact *contact = [[PAContact alloc] init];
            ABRecordRef contactRef = (__bridge ABRecordRef)allContacts[i];
            
            contact.firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactRef, kABPersonFirstNameProperty);
            contact.lastName = (__bridge_transfer NSString *)ABRecordCopyValue(contactRef, kABPersonLastNameProperty);

        }
        
        [MBProgressHUD hideAllHUDsForView:[PAControllerManager mainWindow] animated:YES];
        
    } else if (success) {
        success(NO);
    }
    

//    We copy the firstname and secondname properties to a NSString and concatenate the strings to the fullname, which we will  diplay in our table view later on. The names are assigned to the Person object.
//    The email property of the addressbook is assigned to a multivalue reference
//    because there are multiple emails we loop through each of them and  we assign them to the Person.object
//    Each person object is added to the tableData array
//    when we are done with the address book it can be released
//    When something went wrong the error is logged.
}

@end
