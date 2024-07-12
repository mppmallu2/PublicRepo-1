public class MP_GenericSObjectExample {
    public static List<Account> createAccounts(Integer recordCount) {
        List<Account> accounts = new List<Account>();
        
        Schema.SObjectType objectType = Account.SObjectType;
        
        for (Integer i = 0; i < recordCount; i++) {
            SObject genericRecord = objectType.newSObject();
            genericRecord.put('Name', 'SobjectCast ' + i);
            
            // Dynamic cast to Account
            Account accountRecord = (Account)genericRecord;
            
            accounts.add(accountRecord);
        }
        
        return accounts;
    }
}
/*
List<Account> acc=MP_GenericSObjectExample.createAccounts(5);
database.SaveResult[] result=database.insert(acc,false);
for(database.SaveResult var:result){
    system.debug(var);
} 


*/