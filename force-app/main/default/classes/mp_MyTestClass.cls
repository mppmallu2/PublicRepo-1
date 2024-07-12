@isTest(seeAllData=true)
private class mp_MyTestClass {
    @isTest
    static void testMethod1() {
        // Query the records you want to delete
        List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Name = 'Test Account' limit 1];
        
        // Perform tests or operations on the existing records
        
        // Delete the records
        delete accountsToDelete;
    }
}