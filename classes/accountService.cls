// you are given an input parameter list of accounts
// you need to return the count number of accounts based on industry

/*public with sharing class accountService {
    public static Map<String, Integer> accountCount(List<Account> accounts) {
        Map<String,Integer> resultantMap = new Map<String,Integer>();

        for(Account acc:accounts){
            String industry = acc.Industry;
            if(industry == null){
                acc.Industry = 'Unknown';
            }
        

            if(resultantMap.containsKey(industry)){
                resultantMap.put(industry, resultantMap.get(industry)+1);
            }
            else{
                resultantMap.put(industry, 1);
            }
    
        }
    return resultantMap;    
    }
}*/



//another way of doing it
//using SQL
public with sharing class accountService {
    public static Map<String, Integer> accountCount(List<Account> accounts) {
        Map<String,Integer> resultantMap = new Map<String,Integer>();

        //take all the accountId's
       Set<Id> accountIds = new Set<Id  >();
        for(Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        //get all the account records
        AggregateResult[] resultantValues = [ SELECT Industry, COUNT(Id) totalAccount FROM Account 
                                            WHERE Id IN :accountIds
                                            GROUP BY Industry
        ];
        
        //start a loop and and put the values in the map
        for(AggregateResult arr: resultantValues){
            String industry = (String)arr.get('Industry');
            if(industry == null){
                industry = 'Unknown';
            }
            Integer count = (Integer) arr.get('totalAccount');
            resultantMap.put( industry,count);
        }
        return resultantMap;
    }
}