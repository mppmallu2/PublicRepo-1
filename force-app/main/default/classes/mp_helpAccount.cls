public class mp_helpAccount {
    public static integer lim;
    public static void show(list<Account> acc){
        Id userProfileId = UserInfo.getUserId();
        String profilename = [Select Id,Name,Profile.Name From User where Id =: userProfileId].Profile.Name;
        for(Account a:acc){
            if(a.SameAddres__c && a.ShippingAddress ==null && profilename != System.Label.Profile){
                a.ShippingStreet=a.BillingStreet;
                a.shippingCity=a.BillingCity;
                a.ShippingCountry=a.BillingCountry;
                a.ShippingState=a.BillingState;
                a.ShippingPostalCode=a.BillingPostalCode;
            }else if(profilename != System.Label.Profile){
                a.BillingStreet=a.ShippingStreet;
                a.BillingCity=a.shippingCity;
                a.BillingCountry=a.ShippingCountry;
                a.BillingState=a.ShippingState;
                a.BillingPostalCode=a.ShippingPostalCode;    
            }else{
                
            }
        }
        
    } 
    
    
    // Account child records delete
    /*  public static void accountChildDelete(map<Id,Account> acc){
set<Id> delId=acc.keySet();
list<test__C> ch1=new list<test__c>();
list<child_1__c> ch2=new list<child_1__c>();

list<Account> delchild =[select ID, (select Id from tests__r),(select Id from mommy__r) from Account where Id in:delId];
for(Account ac:delchild){
ch1.addAll(ac.tests__r);
ch2.addAll(ac.mommy__r);
}
delete ch1;
delete ch2;
}  */
    
    
    //VALIDATION RULE WHEN ACCOUNT TYPE IS NULL    
    public static void ValidationRule(list<Account> acc){
        for(account ac:acc){
            if(ac.Type==null){
                ac.addError('not valid');
                
            }
        }
        
    }
    // TO CALCULATE TOTAL CONTACTS AND TOTAL OPPORTUNITY    
    
    
    public static void updateRecord(list<Account> acc){
        if(acc!=null){
            
            for (Account ac : acc) {
                ac.Total_Contacts__c=0;
                ac.Total_Contacts__c = ac.Total_Contacts__c + ac.contacts.size();
                system.debug(ac.contacts.size());
                ac.Total_Opportunity__c = 0 + ac.opportunities.size();
                ac.Totl_Amount__c = 0;
                for(Opportunity opa:ac.Opportunities){
                    if(opa.Amount!=null){
                        ac.Totl_Amount__c = 0 + opa.Amount + ac.Totl_Amount__c;
                    }
                }
            }
            //Insert acc;
            //update acc;
            
            
            
            
            
            
            
            
        }} 
    
    
    Public static Void insertAfter(map<Id,Opportunity> accMap){
       List<Opportunity> opp=[select id,Amount, Account.Id from Opportunity where id in:accMap.keyset()];
    }
    
    Public static void outboundEmail(List<Account> acc){
        
    }
}
/*
list<Account> acc=new list<Account>();
Account a1=new Account(Name='may 11');
Account a2=new Account(Name='may 11_1');
Account a3=new Account(Name='may 11_2');
Account a4=new Account(Name='may 11_3');
acc.add(a1);
acc.add(a2);
acc.add(a3);
acc.add(a4);
insert acc;
*/