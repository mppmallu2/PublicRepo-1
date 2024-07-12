public class mp_Ownership_transfer {
    public static void logicmethod() {
        List<Account> acc = [SELECT Id, OwnerId,Owner.FirstName,ownership FROM Account];
        try {
            for (Account ac1 : acc) {
                if (ac1.OwnerId == '0055i000006hc6mAAA') {
                    ac1.OwnerId ='0055i00000B9EbXAAV';
                }
                ac1.Ownership='Private';
            }
          update acc;
        } catch (Exception e) {
            System.debug(e.getTypeName());
            System.debug(e.getCause());
            System.debug(e.getLineNumber());
            System.debug(e.getStackTraceString());
        }
    }
    
    public static string executebatch(){
        Id jobId=Database.executeBatch(new mp_AccountBAtch1());
        return jobId;
    }
}