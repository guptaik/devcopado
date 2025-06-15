@isTest
public class AccountProcessorTest {
    
    @isTest
    static void testProcessAccountWithNoContacts() {
        // Arrange: create and insert an account with no contacts
        Account acc = new Account(Name = 'Test Account No Contacts');
        insert acc;

        // Act
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{ acc.Id });
        Test.stopTest();

        // Assert
        Account updatedAcc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, updatedAcc.Number_Of_Contacts__c);
    }

    @isTest
    static void testProcessAccountWithContacts() {
        // Arrange: create an account
        Account acc = new Account(Name = 'Test Account With Contacts');
        insert acc;

        // Create 2 contacts related to the above account
        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName = 'John', LastName = 'Doe', AccountId = acc.Id),
            new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = acc.Id)
        };
        insert contacts;

        // Act
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{ acc.Id });
        Test.stopTest();

        // Assert
        Account updatedAcc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, updatedAcc.Number_Of_Contacts__c);
    }
}