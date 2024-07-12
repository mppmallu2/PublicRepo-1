public class mp_UpdateParentAccount implements Queueable {
    private List<Account> accountList;
    
    public mp_UpdateParentAccount(List<Account> accRecords) {
        this.accountList = accRecords;
    }    
   public void execute(QueueableContext context) {
        for (Account acc : accountList) {
            acc.Description = '19th March 2024 updated 									through Queueable Apex using:public class mp_UpdateParentAccount implements Queueable';
        }     
       update accountList;
    }
}
/* @To call this class
  List<Account> accList = [SELECT Id, Name, Description FROM Account];
mp_UpdateParentAccount job = new mp_UpdateParentAccount(accList);
System.enqueueJob(job);
*/