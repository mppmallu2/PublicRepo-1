@isTest
public class mp_Trigger_Contact_Test {
    @testSetup
    public static void setUpData(){
        Account a = new Account();
        a.Name ='TestAcc';
        insert a;
            
    }
    static testMethod void validateSampleApex() {
        Account a = [Select Id,Total_Contacts__c From Account Limit 1];
        contact c = new contact(lastName='BMW', AccountId=a.Id);
        
        Test.startTest();
        insert c;
        Test.stopTest();
		delete c;
        a = [Select Id,Total_Contacts__c From Account Limit 1];
        // Retrieve the record
        //c = [SELECT iD,Name FROM contact WHERE Id =:c.Id];
        
        // Test that the trigger correctly updated the price
        System.assertEquals(0, a.Total_Contacts__c);
    }
    static testMethod void validateOpportunity() {
        Account a = [Select Id,Total_Contacts__c From Account Limit 1];
        Opportunity opp = new Opportunity(Name='BMW', AccountId=a.Id,StageName='Closed Won', CloseDate= Date.newInstance(2022, 06, 09), Amount=100);
        
        Test.startTest();
        insert opp;
        Test.stopTest();
        //a = [Select Id,Total_Contacts__c From Account Limit 1];
        // Retrieve the record
        
        // Test that the trigger correctly updated the price
        //System.assertEquals(1, a.Total_Contacts__c);
    }
}