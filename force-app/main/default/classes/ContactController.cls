public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Account> showAccountList(){
        
        List<Account> accList=[select Id,Name,Phone,BillingState,Type From Account Limit 20];
        return accList;
        
    }    
    
    @AuraEnabled
    Public static map<string,string> filtermethod(string obKey){
        Map<String, String> mapApiAndLabel = new Map<String, String>();
        
        for(Schema.SObjectType thisObj : Schema.getGlobalDescribe().values()) {
            
            Schema.DescribeSobjectResult res = thisObj.getDescribe();
            
            if( res.isAccessible() && res.isQueryable() && (! res.isCustomSetting()) && res.isUpdateable() && res.isCreateable() ) { 
                
                mapApiAndLabel.put(res.getLabel(),res.getName());
                system.debug('APi Name:'+res.getName()+'  '+'label:'+res.getLabel());
                
            }
            
        }
        return mapApiAndLabel;
    }
    
}