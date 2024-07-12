@isTest
public class mp_DataFactory_test {
    @isTest
    static void DataFactory(){
        // mp_DataFactory.createAccount();
        //mp_DataFactory.createContact();
         List<Account> accList1=new List<Account>();
        for(integer i=0;i<3;i++){
            Account acc=new Account(Name='mp'+i);
            accList1.add(acc);
        }
        insert accList1;
        Test.startTest();
        List<Account> accList=new List<Account>();
        for(integer i=0;i<10000;i++){
            Account acc=new Account(Name='mp'+i);
            accList.add(acc);
        }
        insert accList;
        Test.stopTest();
        list<Account> acc=[select Id,Name from Account];
        system.Assert(acc.size()==11000,'Bad, Governer Limits');
        system.debug(acc);
    }  
}