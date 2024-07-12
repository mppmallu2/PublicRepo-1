public with sharing class LWCController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetailsApex(){
        return [Select Name From Account LIMIT 10];
    }
}