@isTest
private class mp_Trigger_ContactTest {
    @isTest
    static void testTrigger() {
        // Create test data
        List<Contact> contacts = new List<Contact>();
        Account testAccount = new Account(Name = 'Test Account');
        
        for (Integer i = 0; i < 5; i++) {
            Contact contact = new Contact(AccountId = testAccount.Id, LastName = 'Test Contact ' + i);
            contacts.add(contact);
        }
        test.startTest();
        insert contacts;
        test.stopTest();
        // Test before insert trigger
        System.assertEquals(5, testAccount.Total_Contacts__c);
        System.assertEquals(0, testAccount.Total_Opportunity__c);
        System.assertEquals(0, testAccount.Totl_Amount__c);

        // Test after insert trigger
        List<Account> updatedAccounts = [SELECT Total_Contacts__c, Total_Opportunity__c, Totl_Amount__c FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(5, updatedAccounts[0].Total_Contacts__c);
        System.assertEquals(0, updatedAccounts[0].Total_Opportunity__c);
        System.assertEquals(0, updatedAccounts[0].Totl_Amount__c);

        // Update contact
        Contact updatedContact = contacts[0];
        updatedContact.LastName = 'Updated Contact';
          test.startTest();
        update updatedContact;
          test.stopTest();

        // Test before update trigger
        System.assertEquals(5, testAccount.Total_Contacts__c);
        System.assertEquals(0, testAccount.Total_Opportunity__c);
        System.assertEquals(0, testAccount.Totl_Amount__c);

        // Test after update trigger
        updatedAccounts = [SELECT Total_Contacts__c, Total_Opportunity__c, Totl_Amount__c FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(5, updatedAccounts[0].Total_Contacts__c);
        System.assertEquals(0, updatedAccounts[0].Total_Opportunity__c);
        System.assertEquals(0, updatedAccounts[0].Totl_Amount__c);
test.startTest();
        // Delete contact
        delete contacts;
        test.stopTest();

        // Test before delete trigger
        System.assertEquals(0, testAccount.Total_Contacts__c);
        System.assertEquals(0, testAccount.Total_Opportunity__c);
        System.assertEquals(0, testAccount.Totl_Amount__c);

        // Test after delete trigger
        updatedAccounts = [SELECT Total_Contacts__c, Total_Opportunity__c, Totl_Amount__c FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(0, updatedAccounts[0].Total_Contacts__c);
        System.assertEquals(0, updatedAccounts[0].Total_Opportunity__c);
        System.assertEquals(0, updatedAccounts[0].Totl_Amount__c);
    }
}