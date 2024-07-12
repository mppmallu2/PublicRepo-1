public class mp1_AccountBAtch1  implements Database.Batchable<sObject> {
	public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('Select Type,Id,Description from Account');
   }
    
    public void execute(Database.BatchableContext BC, List<Account> updt){
     for(Account acc :updt){
     acc.Active__c='NO';
     acc.Description=null;
     }
     update updt;
    }
    public void finish(Database.BatchableContext BC){
       /* List<Account> acc=[select Id,Name from Account limit 200];
        set<Id> ids=new set<Id>();
        for(Account ac:acc){
            ids.add(ac.id);
        }
        mp_Future_Class.updateRecord(ids); */       
       
        
    } 
}

/*
to call this batch class
mp_AccountBAtch1   batch = new mp_AccountBAtch1();
Database.executeBatch(batch);
 
*/