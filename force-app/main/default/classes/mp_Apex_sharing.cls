public class mp_Apex_sharing {
    public Id recordId = 'a085i00000KoAf6AAF';
    public Id userIdToShareWith = '0055i00000B9EbXAAV';
    public static void sharing(mp_Apex_sharing acc){
        // Specify the object and record IDs you want to share
        // Replace with the actual record ID
        // Replace with the actual user ID
        
        // Create an instance of the Share object
        // Replace 'Object_API_Name__Share' with the API name of the object you want to share (e.g., AccountShare, OpportunityShare, etc.)
        mpContact__Share shareRecord = new mpContact__Share();
        // Set the ID of the record you want to share
        shareRecord.ParentId=acc.recordId;      
        // Set the ID of the user or group you want to share the record with
        shareRecord.UserOrGroupId=acc.userIdToShareWith;        
        // Set the sharing access level (Read, Edit, etc.)
        shareRecord.AccessLevel = 'Edit'; // You can use 'Read', 'Edit', 'All', or 'None'
        // shareRecord.RowCause='Manual';
         
        // Insert the share record
        try {
            insert shareRecord;
            System.debug('Record shared successfully.');
        } catch (DmlException e) {
            System.debug('Error sharing record: ' + e.getMessage());
        }
        
    }  
    public static void removeShare( mp_Apex_sharing acc) {
        // Replace 'Object_API_Name__Share' with the API name of the object you want to remove sharing from (e.g., AccountShare, OpportunityShare, etc.)
        List<mpContact__Share> sharesToDelete = [SELECT Id FROM mpContact__Share WHERE ParentId = :acc.recordId AND UserOrGroupId = :acc.userIdToShareWith];
        
        if (!sharesToDelete.isEmpty()) {
            try {
                delete sharesToDelete;
                System.debug('Shared record removed successfully.');
            } catch (DmlException e) {
                System.debug('Error removing shared record: ' + e.getMessage());
            }
        } else {
            System.debug('No shared records found for the specified user.');
        }
    }
}


/*
execute
mp_Apex_sharing sharingInstance = new mp_Apex_sharing();
sharingInstance.sharing(sharingInstance);
*/