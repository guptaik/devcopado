public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
// Step 1: Query contacts grouped by AccountId     
Map<Id, Integer> contactCountMap = new Map<Id, Integer>(); 
        
         for (AggregateResult ar : [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds
            						GROUP BY AccountId]) 
         {
            contactCountMap.put((Id)ar.get('AccountId'), (Integer)ar.get('contactCount'));
        }
         // Step 2: Prepare Account records to update
        List<Account> accountsToUpdate = new List<Account>();

        for (Id accId : accountIds) {
            Integer count = contactCountMap.containsKey(accId) ? contactCountMap.get(accId) : 0;
            accountsToUpdate.add(new Account(
                Id = accId,
                Number_Of_Contacts__c = count
            ));
        }

        // Step 3: Perform the DML update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}