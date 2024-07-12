public class mp_GroupOwnershipTransfer {
    public static void transferCaseTeamOwnership() {
        
        List<Account> acc = [SELECT Id,OwnerID FROM Account where ownerid='0055i00000ATOvzAAH'];
        
        list<USer> usr=[select Id,Name from User limit 1000];
        List<CaseTeamMember> updatedMembers = new List<CaseTeamMember>();
        for (Account acd :acc) {
            system.debug(acd.OwnerId);
            string usr1=[select Id,Name from User where Id=:acd.ownerId limit 1].name;
            system.debug(usr1);
            
        }
        
    }      
}