public class AccountUpdateBatchJob implements Database.Batchable<Sobject>,Database.Stateful {
    Public Static integer size=0;
  
    public Database.QueryLocator start(Database.BatchableContext BC){
        User u=[select Id,FirstName from User where FirstName='Sachin'];
        String query='Select Id,OwnerId From Account where OwnerId=\''+u.Id+'\'';
            return Database.getQueryLocator(query);
    }
    Public void Execute(Database.BatchableContext BC,List<Account> acc){
        For(Account ac:acc){
          
            size+=1;
        }
    }
    Public Void Finish(Database.BatchableContext BC){
      
    insert new Account(Name='sizebatched:'+size);
    }  
}