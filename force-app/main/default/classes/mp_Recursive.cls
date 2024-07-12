public class mp_Recursive {
    Public static integer count=0;
    public static void calculateSum(Integer n) {
        system.debug(count);
        count++;
        
        
        
        calculatesum(n);     
        
    }   
    Public Static void metgh(integer add,string names){
		system.debug(add);
        system.debug(names);
    }
    
    Public static void runa(){
        List<Opportunity> oppList=[SELECT Id,Name,opportunity.accountId from Opportunity limit 10];
        for(opportunity opp:oppList){
            string df=opp.accountId;
            system.debug(df);
        }
        
    }
}