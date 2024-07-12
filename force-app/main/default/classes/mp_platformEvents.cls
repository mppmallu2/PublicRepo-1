public class mp_platformEvents {
    
    Public static void fireEvent(){
        List<Account> accList=[select id,name,phone from account limit 4];
        string bodyJson=json.serialize(accList);
        
        sachin_json_output__e ins=new sachin_json_output__e();
        ins.body__c=bodyJson;
        
        Database.SaveResult results = EventBus.publish(ins);
       
    }
    
}