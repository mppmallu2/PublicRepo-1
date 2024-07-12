public with sharing class mp_help_Contact {
    public static void NO_of_Contact(list<Contact> cont){
            set<Id> conAcId=new set<Id>();
            for(Contact co:cont){
                conAcId.add(co.AccountId);       
            }
            list<Account> accUPdate=[SELECT ID,
                                     Total_Contacts__c,
                                     Total_Opportunity__c,
                                     Totl_Amount__c,
                                     (select Id from Contacts),
                                     (select Id,Amount from Opportunities) 
                                     FROM ACCOUNT WHERE ID IN:conAcId];
            mp_helpAccount.updateRecord(accUPdate);        
    }
}