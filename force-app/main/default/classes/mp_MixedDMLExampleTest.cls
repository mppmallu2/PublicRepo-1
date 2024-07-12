// sourec link https://www.apexhours.com/mixed-dml-operation-error-in-salesforce/
@isTest
private class mp_MixedDMLExampleTest {
    
    static testMethod void mixedDMLExample() {  
        User u;
        
        Account a = new Account(Name='ApexHours');
        insert a;
        
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];

        System.runAs (thisUser) {
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
           
            User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
               emailencodingkey='UTF-8', lastname='Hours', 
               languagelocalekey='en_US', 
               localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
               timezonesidkey='America/Los_Angeles', 
               username='apexhoursmpggtg@apexhours.com');
            insert usr;
        }
        
    }
}