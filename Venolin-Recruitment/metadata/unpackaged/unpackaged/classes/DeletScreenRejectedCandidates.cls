global class DeletScreenRejectedCandidates implements database.Batchable<sObject> {
    global list<Candiate__c> DeleteCandidates = new list<Candiate__c>();
    public Database.QueryLocator start (database.BatchableContext bc){
        return Database.getQueryLocator([select ID, First_name__c, Last_name__c 
                                     	From Candiate__c 
                                     	Where Status__c = 'ScreenReject']);
    }
    public void execute (database.batchableContext bc, List<Candiate__c> scope){     //List<sObject> scope
      
       /* for(sObject reject : scope){
           Candiate__c newReject = (Candiate__c)reject; //type casting from generic sOject to Candiate__c
            DeleteCandidates.add(newReject);            
        }   
        delete DeleteCandidates;*/
        delete scope;
    }
    public void finish (database.batchableContext bc){
       
    }
          
}