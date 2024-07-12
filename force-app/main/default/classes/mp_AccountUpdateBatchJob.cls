global class mp_AccountUpdateBatchJob implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name,Description FROM Account limit 200';
        
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        for (Account a : scope) {
            String originalName = 'aNamesubstringBefore';
            a.Description=originalName;
            
        }
        
        update scope;
        
    }
    global void finish(Database.BatchableContext BC) {
    }
}

/* @cal this class using,
* AccountUpdateBatchJob batchJob = new AccountUpdateBatchJob();
Integer batchSize = 200; // Specify the batch size according to your needs
Database.executeBatch(batchJob, batchSize);  
*/