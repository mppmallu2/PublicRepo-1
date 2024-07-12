@isTest
public class mp_helpAccountTest {

    //@isTest --> TO Identify wheather its Test class or Test method 
    //@testSetUp --> To Create Test Data/Records
    //@testVisible --> To cover the Private methods of a class
    
    @testSetUp
    public static void createTestData(){
        Profile p = [Select Id,Name From Profile Where Name='Read Only'];
        User u = new User();
        u.ProfileId = p.Id;
        u.Alias = 'mpTest';
        u.FirstName = 'firstName';
        u.LastName = 'lastname';
        u.Username = 'username@mp.com';
        u.email = 'test@mp.com';
        u.emailencodingkey='UTF-8';
        u.languagelocalekey='en_US';
        u.localesidkey='en_US';
        u.country='United States';
        u.IsActive =true;
        u.timezonesidkey='America/Los_Angeles';
        insert u;
        list<Account> acin=new list<Account>();
        for(integer i=0;i<20;i++){
        Account a = new Account();
        a.Name ='test Account 1'+i;
        a.ShippingStreet='street'+i;
        a.shippingCity='city';
        a.ShippingCountry='country';
        a.ShippingState='state';
        a.ShippingPostalCode='123';
        a.AccountNumber='123';
        acin.add(a);
        }    
        insert acin;
    }
    @isTest
       static void createTestData1(){
        Account a = new Account();
        a.Name ='test Account 2';
        a.ShippingStreet='street';
        a.shippingCity='city';
        a.ShippingCountry='country';
        a.ShippingState='state';
        a.ShippingPostalCode='123';
        User u = [Select Id,Name From User LIMIT 1];
          System.runAs(u){
              Test.startTest();
              insert a;
              Test.stopTest();
              a = [Select Id ,BillingStreet from Account Where Name ='test Account 2' LIMIT 1];
          }
        //System.assertEquals('street', a.BillingStreet);
    }
    
    @isTest
     public static void createTestData2(){
        list<Account> acx = [Select Id,Name,ShippingStreet,ShippingCity,ShippingCountry,ShippingState,ShippingPostalCode From Account];
         for(Account acv:acx){
         acv.BillingStreet='street';
		acv.BillingCity='city';
		acv.BillingCountry='country';
		acv.BillingState='state';
		acv.BillingPostalCode='123';  
        acv.SameAddres__c=false;
         }
        Test.startTest();
        update acx;
          mp_helpAccount.show(acx);
        Test.stopTest();
         //a = [Select Id ,BillingStreet from Account Where Name ='test Account' LIMIT 1];
        //System.assertEquals('street', a.BillingStreet);
    }
    
}