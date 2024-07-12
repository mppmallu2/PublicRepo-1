public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchName) {
        List<List<SObject>> searchResults = new List<List<SObject>>();
        
        String searchQuery = 'FIND \'' + searchName + '\' IN ALL FIELDS RETURNING Contact(Id, Name), Lead(Id, Name)';
        searchResults = search.query(searchQuery);
        
        return searchResults;
    }
}