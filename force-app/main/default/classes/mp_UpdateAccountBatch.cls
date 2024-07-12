global class mp_UpdateAccountBatch implements Database.Batchable<Sobject>, Database.Stateful {
    public static Integer startMethodCount = 0;
    public static Integer executeMethodCount = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        startMethodCount++; // Increment start method count
        System.debug('Start method executed ' + startMethodCount + ' times.');
        // Query the records you want to process (e.g., updating a custom field on Account)
        return Database.getQueryLocator('SELECT Id, Name, Description FROM Account');
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        executeMethodCount++; // Increment execute method count
        System.debug('Execute method executed ' + executeMethodCount + ' times.');
        
        for (Account acc : scope) {
            acc.Description = 'Iteration: ' + executeMethodCount;
        }
        update scope; // Commit changes
    }

    global void finish(Database.BatchableContext bc) {
        // Optional: Perform any cleanup or final actions
    }
}