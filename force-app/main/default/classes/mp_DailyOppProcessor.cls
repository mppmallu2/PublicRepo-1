public class mp_DailyOppProcessor Implements Schedulable{
    public void execute(SchedulableContext sc){
        List<Opportunity> oppList=[Select Id,LeadSource
                                  From Opportunity 
                                  where LeadSource=null Limit 200];
        for(Opportunity opp:oppList){
            opp.LeadSource='web';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }

}