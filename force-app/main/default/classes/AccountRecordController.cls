public with sharing class AccountRecordController {
    
    @AuraEnabled(cacheable = false)
    public static Account getSingleAccount(Id accId){   
        account acc=new Account(name=accID);
        insert acc;
        return [SELECT Id, Name, Industry
                FROM Account 
                WHERE Id =: accId];
    }
    @future
    Public static void postm(set<Id> postd){
        List<Account> acc=[select id from Account where id in:postd];
        system.debug(acc.size());
}
}