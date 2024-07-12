@isTest
public class mpclassTest {
    @isTest
    Private static void method(){
        /*List<Account> accList=new List<Account>();
for(integer i=0;i<10;i++){
account acc=new account(Name='test Running'+i);
accList.add(acc);
}
insert accList;

system.assertEquals(10,accList.size(),'Success'); */
       
        MpClass.method();
        List<Account> accList=[select Name from Account];
     system.assertEquals(10,accList.size(),'Success');

        
    }
    
}