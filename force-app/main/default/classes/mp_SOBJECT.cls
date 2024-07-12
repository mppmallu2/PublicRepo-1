public class mp_SOBJECT {
    public static void insertTwo(){
        account ac1=new Account(Name='inserted by sobject');
        contact cc1=new Contact(LastName='inserted by sObject');
        List<sObject> ss1=new List<sObject>();
        ss1.add(ac1);
        ss1.add(cc1);
        insert(ss1);
    }
  	@AuraEnabled(cacheable=true)
    public static List<Account> Accountmethod(string Name){
        list<Account> acc=[select Id,Name,Industry,	
                           Phone,rating,AccountNumber
                           from Account];
      
        return acc;
    }
    @AuraEnabled(cacheable=false)
    public static List<Account> Accountmethod1(){
        list<Account> acc=[select Id,Name,Industry,	
                           Phone,rating,AccountNumber
                           from Account limit 10];
      
        return acc;
    }
    public static list<list<sobject>> wrapSobject(){
        List<Account> aclist=[select id,name from account limit 10];
        list<contact> cclist=[select id,lastName from contact limit 10];
        List<List<sobject>> listk=new list<list<sobject>>();
        listk.add(aclist);
        listk.add(cclist);
        return listk;
    }
}