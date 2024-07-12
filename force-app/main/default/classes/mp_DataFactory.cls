@isTest
public class mp_DataFactory {
	@isTest
    public static string createAccount() {
        Account acc = new Account(
            Name = 'DataFactoryAccount1245',
            phone = 'DataFactoryAccount1245'
        );
        insert acc;
        return acc.Name;
    }

    public static Contact createContact() {
        Contact contact = new Contact(
            LastName = 'DataFactoryContact1245'
        );
        insert contact;
        return contact;
    }
}

/* Usage
Account account = mp_DataFactory.createAccount();
Contact contact = mp_DataFactory.createContact();
*/