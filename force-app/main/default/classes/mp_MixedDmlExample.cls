public class mp_MixedDmlExample {
    public static void updateAccountAndContact() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Contact con = new Contact(LastName = 'Test Contact', AccountId = acc.Id);
        insert con;
        
        acc.Name = 'Updated Account';
        update acc;
        
        // The following DML operation causes a mixed DML error
        User usr = new User(Username = 'testuser@example.com', LastName = 'Test User');
        insert usr;
    }
}