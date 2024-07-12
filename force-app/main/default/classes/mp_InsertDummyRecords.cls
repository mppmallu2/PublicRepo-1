public class mp_InsertDummyRecords {
    public static void insertDummyData(){     
       List<Account> accounts = new List<Account>();
        for (Integer i = 1; i < 200; i++) {
            Account acc = new Account();
            acc.Name='Rahul Mane'+i;
            acc.AccountNumber='SBI0001234'+i+i;
            acc.Rating='Hot';    
            if(i<40){
                acc.AccountSource='web';
                acc.BillingCity='Pune';
                acc.BillingCountry='India';
                acc.BillingStreet='Kartavya Path';
                acc.BillingState='Maharashtra';
                acc.Industry='Finance';
                acc.Phone='+91-91832345'+i+i;
                acc.Type='Prospect';
                acc.Rating='Hot';
                acc.Description='Dummy data created for Indian Accounts';
            }else if(i<80 && i>40){
                acc.AccountSource='Phone Inquiry';
                acc.BillingCity='Dhaka';
                acc.BillingCountry='Bangladesh';
                acc.BillingStreet='Bangla Road';
                acc.BillingState='Barisal Division';  
                acc.Industry='Chemicals';
                acc.Phone='+880-783457234'+i;
                acc.Type='Channel Partner / Reseller';
                acc.Rating='Warm';
                acc.Description='Dummy data created for Bangladesh Accounts';
            }else if(i<120 && i>80){
                acc.AccountSource='Partner Referral';
                acc.BillingCity='Colombo';
                acc.BillingCountry='Srilanka';
                acc.BillingStreet='Bibhishan Street';
                acc.BillingState='Jaffna';
                acc.Industry='Banking';
                acc.Phone='+94-673487534'+i;
                acc.Type='Installation Partner';
                acc.Rating='cold';
                acc.Description='dummy data created for Srilanka Acounts';
                
            }else{
                acc.AccountSource='Purchased List';
                acc.BillingCity='Karachi';
                acc.BillingCountry='Pakistan';
                acc.BillingStreet='Jinna Road';
                acc.BillingState='Islamabad';
                acc.Industry='Agriculture';
                acc.Phone='+92-89723465'+i;
                acc.Type='Customer - Channel';
                acc.Rating='None';
                acc.Description='Dummy data for Pakistans';
            }
            acc.Active__c='Yes';
            acc.AnnualRevenue=12345*i;
            acc.NumberOfEmployees=3*(3+i);
            acc.Website='www.Youtube.com/?watch/sd'+i;
            accounts.add(acc); 
            
        } 
        insert accounts;
    }   
    Public static void method_dummy(){
        List<Contact> contacts = new List<Contact>();
        List<Opportunity> opportunities = new List<Opportunity>();
        list<Account> acd=[select Id,Name From Account];     
    	  integer i=0;
        for(Account ids:acd){
          i+=1;
            Contact con = new Contact(
                                     LastName = ids.name,
                                      Email = 'mail'+i+'@example.com',
                                      Phone =ids.id,
                                      AccountId = ids.Id);
            contacts.add(con);
            //Opportunity            
            Opportunity opp = new Opportunity();
            
            if(i<50){
                opp.Name = ids.Name  + i;
                opp.LeadSource='Web';
                opp.Type='Existing Customer - Upgrade';
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today().addDays(50);
                opp.Amount = 10000 * (i + 5);
                opp.AccountId = ids.Id;
            }else if(i<100 && i>50){
                opp.Name = 'Dummy Opportunity ' + i;
                opp.LeadSource='Phone Inquiry';
                opp.Type='Existing Customer - Replacement';
                opp.StageName = 'Qualification';
                opp.CloseDate = Date.today().addDays(80);
                opp.Amount = 10000 * (i + 3);
                opp.AccountId = ids.Id;
            }else if(i<150 && i>100){
                opp.Name = 'Dummy Opportunity ' + i;
                opp.LeadSource='Partner Referral';
                opp.Type='Existing Customer - Downgrade';
                opp.StageName = 'Value Proposition';
                opp.CloseDate = Date.today().addDays(18);
                opp.Amount = 10000 * (i + 7);
                opp.AccountId = ids.Id;
            }else if(i>150 && i<170){
                opp.Name = 'Dummy Opportunity ' + i;
                opp.LeadSource='Purchased List';
                opp.Type='New Customer';
                opp.StageName = 'Negotiation/Review';
                opp.CloseDate = Date.today().addDays(4);
                opp.Amount = 10000 * (i + 4);
                opp.AccountId = ids.Id;
            }else {
                opp.Name = 'Dummy Opportunity ' + i;
                opp.LeadSource='Other';
                opp.StageName = 'lost';
                opp.CloseDate = Date.today().addDays(4);
                opp.Amount = 10000 * (i + 4);
                opp.AccountId = ids.Id;
            }
            opportunities.add(opp);
            
          //i++;
            
        }
        

    insert contacts;
    insert opportunities;
    }
}