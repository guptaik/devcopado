public class ContactAndLeadSearch {
	
    public static List<List<SObject>> searchContactsAndLeads(String s){
        
          return [FIND :s IN NAME FIELDS RETURNING 
                    Contact(Id, FirstName, LastName), 
                    Lead(Id, FirstName, LastName)]; 
    }
}