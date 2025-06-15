public with sharing class AddPrimaryContact implements Queueable {
    
   private Contact baseContact;
    private String state;
    //Constructor
    public AddPrimaryContact(Contact baseContact , String state){
        this.baseContact =baseContact;
        this.state = state;
    }

    public void execute(QueueableContext context){
        List<Account> records = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        
        List<Contact> contactsToInsert = new List<Contact>();
        for(Account acc : records){
            Contact con = baseContact.clone();
            con.AccountId = acc.Id;

            contactsToInsert.add(con);
        }
        
         if (!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }

    }
}