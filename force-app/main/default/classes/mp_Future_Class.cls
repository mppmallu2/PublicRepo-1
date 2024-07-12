public class mp_Future_Class {
    @future
    public static void updateRecord(set<ID> idkey){
         list<Account> acc=[select Id,Name,
                            Total_Contacts__C,
                            Total_Opportunity__c,
                            (select Id,amount from opportunities ),
                            (select Id from contacts),
                            Totl_Amount__c from 
                            Account where id in:idkey];
        for (Account ac : acc) {
            ac.Total_Contacts__c=ac.contacts.size();
            ac.Total_Opportunity__c=ac.opportunities.size();
          	ac.Totl_Amount__c=0;
            for(Opportunity opa:ac.Opportunities){
                if(opa.Amount!=Null){
               ac.Totl_Amount__c=opa.Amount+ac.Totl_Amount__c;
            }
            }
        }
        //Insert acc;
        update acc;
    
    }

}