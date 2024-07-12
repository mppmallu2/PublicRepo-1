public class mp_mpAccount_History {
    Public static void count_field(map<Id,mpAccount__c> triggerId){
        List<AggregateResult> results=[SELECT ParentId, COUNT(Id) hist
										FROM mpAccount__History
										WHERE Field = 'Year__C'
										GROUP BY ParentId];

       List<mpAccount__c> mpAccUpdate=new List<mpAccount__c>();
        for(AggregateResult cal:results){
            integer a=(Integer)cal.get('hist');
            mpAccount__c up=new mpAccount__C(id=(id)cal.get('ParentId'),count__c=a);
            mpAccUpdate.add(up);
        }
        update mpAccUpdate;
    }
    
}