@isTest
public class mp_UpdateParentAccountTest {
	@testSetup
    static void setup(){
        list<Account> accList=new list<Account>();
        
        for(integer i=0;i<100;i++){
          acclist.add(new Account(Name='testClass'+i));  
        }
        insert accList;
    }
    @isTest
    static void testQueueable(){
        List<Account> accList = [SELECT Id, Name, Description FROM Account];
        mp_UpdateParentAccount job = new mp_UpdateParentAccount(accList);
        Test.startTest();
        system.enqueueJob(job);
        Test.stopTest();
        system.assertEquals(100,[select count() from Account where name like 'test%']);
    }
}