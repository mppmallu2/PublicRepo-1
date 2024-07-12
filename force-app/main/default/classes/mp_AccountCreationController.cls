public class mp_AccountCreationController {
    public Account acc { get; set; }
    public Account listAccounts {get;set;}
    
    public mp_AccountCreationController() {
        acc = new Account();
    }
    
    public PageReference createAccount() {
        
        try {
            insert acc;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Account created successfully.'));
            listAccounts=[select id,Name,phone,website from Account limit 5];
            acc = new Account(); // Reset the input fields
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error creating account: ' + e.getMessage()));
        }
        return null;
    }
}