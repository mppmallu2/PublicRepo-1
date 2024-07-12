public class mp_heapSize {
    Public static void calcim(){
        for(List<Account> acc:[Select id,name from account ]){
            system.debug(acc.size());
            for(account ac:acc){
                ac.Description=system.now().toString()+' '+'size:'+acc.size();
            }
            update acc;
        }
        system.debug('limit :'+limits.getQueries()+'/');
    }

    public static void orgLimit(){
        Map<String,System.OrgLimit> limitsMap = OrgLimits.getMap();
        for(integer i=0;i<limitsMap.size();i++){
            
            system.debug(limitsMap.keySet().iterator().next()+':'+limitsMap.get(limitsMap.keySet().iterator().next()));
        }
    }

}