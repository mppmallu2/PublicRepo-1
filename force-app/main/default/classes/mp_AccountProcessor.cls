public with sharing class mp_AccountProcessor {
	//== Method to execute on after Insert of contact
	public static void onAfterSave (List<Contact> contacts) {
		// Set to hold the account Id's from Contact
		Set<Id> acctIds = new Set<Id>();
		// Loop to iterate over the list of contacts
		for(Contact con : contacts) {
			if(con.AccountId != null) {
				acctIds.add(con.AccountId);
			}
		}
		if(acctIds.size() > 0 && acctIds != null) {
			updateAccount(acctIds);
		}
        system.debug('contact triggered');
	}

	//== Method to update the account based on Number of contacts
	@future(callout=false)
	private static void updateAccount(Set<Id> accIds) {
		// Qeury to fetch the account records based on AccountId from contact
		List<Account> accnts = [SELECT ID, Name,Number_of_Contacts__c, (SELECT Id FROM Contacts)
										FROM Account
										WHERE ID = :accIds];
										System.debug('query results : ' +accnts.size());

		// Loop to iterate over the list of account records from Query results
		for(Account acc : accnts) {
			List<Contact> cons = acc.Contacts; // List to hold the contacts that related to account
			acc.Number_of_Contacts__c = cons.size();
			System.debug('Account:'+ acc.Name + ' has ' + acc.Number_of_Contacts__c + ' Contact childs');
		}

		try {
			update accnts;
		} catch(DMLException e) {
			throw new stringException('Faile to update the accounts : '+e.getMessage());
		}
	}
    @Future (Callout=false)
    public static void triggerFuture(){
       contact ad=new contact();
        ad.LastName='contact535435';
        ad.AccountId='0015i00000e44oBAAQ';
        insert ad;     
    }
}