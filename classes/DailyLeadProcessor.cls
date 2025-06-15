public with sharing class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext sc){

        List<Lead> leadsWithBlanks = new List<Lead>([SELECT Id FROM Lead WHERE LeadSource = null LIMIT 200]);
        
        for (Lead ld : leadsWithBlanks){
            ld.LeadSource = 'Dreamforce';
        }
        update leadsWithBlanks;
    }
}