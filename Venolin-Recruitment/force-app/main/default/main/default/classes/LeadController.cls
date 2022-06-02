public class LeadController {

    @AuraEnabled
    public static string updateLeadDetails(id leadId){
        
        try{
            Lead__c ld=[select id,status__c from lead__c where Id=:leadId];
            ld.status__c='Converted';
            update ld;
            
            return 'SUCCESS';
        }
        catch(exception e){
            system.debug('exception caught :'+e.getMessage());
            return 'ERROR';
        }
       
    }
}