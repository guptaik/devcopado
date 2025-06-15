public with sharing class AccountHelperLWC {
    
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccountList(Id accId){
        try {
            return [Select Id,Name,Phone,Type from Account WHERE Id = :accId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}