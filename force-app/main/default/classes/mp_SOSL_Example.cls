public class mp_SOSL_Example {
    public static void searchAccounts(String searchString) {
        List<List<SObject>> searchResults = [FIND :searchString IN ALL FIELDS RETURNING Account(Id, Name, Industry)];
        
        List<Account> accounts = new List<Account>();
        for (List<SObject> resultList : searchResults) {
            for (SObject result : resultList) {
                Account account = (Account)result;
                accounts.add(account);
            }
        }
        
        // Process the search results
        for (Account account : accounts) {
            System.debug('Account Name: ' + account.Name);
            System.debug('Industry: ' + account.Industry);
            system.debug('Record Id'+account.Id);
        }
    }
}