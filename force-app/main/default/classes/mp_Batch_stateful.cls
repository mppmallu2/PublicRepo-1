global class mp_Batch_stateful implements Database.Batchable<SObject>, Database.Stateful {
    // Stateful variable to store emails
    private Set<String> emailSet = new Set<String>();
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // You would provide your query here
        return Database.getQueryLocator('SELECT Id, Email FROM Contact WHERE Email != null');
    }
    
    global void execute(Database.BatchableContext BC, List<SObject> scope) {
        // Process records and add emails to the emailSet
        for (Contact contact : (List<Contact>)scope) {
            emailSet.add(contact.Email);
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        // Access emails from the emailSet in the finish method
        System.debug('Total unique emails processed: ' + emailSet.size());
        for (String email : emailSet) {
            System.debug('Processed email: ' + email);
        }
    }
}