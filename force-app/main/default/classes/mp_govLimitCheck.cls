//public class  implements Database.Batchable<sObject>,Database.Stateful{
public class mp_govLimitCheck implements Database.Batchable<SObject> {
    public Iterable<Account> start(Database.BatchableContext info) {
        return new mp_MyAccountIterable();
    }
    
    public void execute(Database.BatchableContext info, List<Account> scope) {
        List<Account> accsToUpdate = new List<Account>();
        
        for (Account a : scope) {
            a.Name = 'Updated ' + a.Name;
            a.NumberOfEmployees = 70;
            accsToUpdate.add(a);
        }
        
        update accsToUpdate;
    }
    
    public void finish(Database.BatchableContext info) {
        // Perform any post-processing if needed
    }
}