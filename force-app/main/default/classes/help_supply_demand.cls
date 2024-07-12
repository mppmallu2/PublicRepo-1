public class help_supply_demand {
//Method for Validation Rule    
    public static void method_validation_rule(map<Id,Supply_And_Demand__c> t1){
        for(Supply_And_Demand__c it1:t1.values() ){
            if(it1.Contract_End_Date__c < it1.Contract_Start_Date__c){
                it1.addError('Invalid date range: The end date must be later than the start date');
            }
        }        
    }
//method for Insert Operation    
    public static void method_insert(map<Id,Supply_And_Demand__c> t2){
         help_supply_demand.method_validation_rule(t2);
        system.debug('stage 1');
        for(Supply_And_Demand__c it2:t2.values() ){
            if(it2.RecordTypeId!=null && it2.RecordTypeId==System.Label.Demand){
                system.debug('record type is demand');
                method_forecastDetail_Demand(t2);
                
            } else {
            	system.debug('record type is supply');
               // method_forecastDetail_Supply();
            }
        }       
    }          
//forecast detail child object records creation method
    public static void method_forecastDetail_Demand(map<Id,Supply_And_Demand__c> mpsd){
        list<Supply_And_Demand__c> buck=[SELECT ID,Name,
                                         Contract_start_Date__c,
                                         Contract_End_Date__C 
                                         From Supply_And_Demand__c 
                                         where Id in:mpsd.keyset()];
        for(Supply_And_Demand__c it3:buck){
            list<Forecast_Details__c> fcd1=new list<Forecast_Details__c>();  
            for(date i=it3.Contract_Start_Date__c;i<=it3.Contract_End_Date__c;i=i.addYears(1)){

            }
        }
              
    }
}