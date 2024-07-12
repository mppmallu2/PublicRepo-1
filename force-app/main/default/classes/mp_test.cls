@isTest
public class mp_test {
     @TestSetup
    static void data(){
        list<Account> acd=new List<Account>();
        for(integer i=0;i<10;i++){
            Account acc=new Account();
            acc.Name='Name'+i;
            acc.Type=null;
            acd.add(acc);
        }
        insert acd; 
    }
    
    @isTest
    static void dod(){
      list<Account> acc=[select Name,Type from Account];
        mp_helpAccount.ValidationRule(acc);
        }
	@isTest
    Private static void metd(){
        integer a=10;
        integer b=null;
       assert.isnull(b,'yes');
//system.assert(a>1,'true state');
    }
}