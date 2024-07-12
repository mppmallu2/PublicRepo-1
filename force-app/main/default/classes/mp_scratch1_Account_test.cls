@isTest
public class mp_scratch1_Account_test {
    private static list<Account> acclist=new List<Account>();
    @testsetup
    static void method1(){
        for(integer i=0;i<20000;i++){
            account acc=new Account(Name='mppl'+i);
            acclist.add(acc);
        }
       
    }
    @isTest
    static void method2(){
         test.startTest();
    insert acclist;
      test.stopTest();  
        list<Account> ac=[select Name from Account];
        system.debug(ac.size());
    }

}