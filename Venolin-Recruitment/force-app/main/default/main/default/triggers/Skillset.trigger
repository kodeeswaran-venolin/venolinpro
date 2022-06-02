trigger Skillset on Lead__c (before update, before insert) {
for(Lead__c ld:Trigger.new){
    if(ld.SFDC_Configuration__c){
    ld.admin__c=True;
    ld.Workflows__c=True;
    ld.Process_Builder__c=True;
    ld.force_com__c=True;
    ld.SOQL__c=True;
    ld.Data_Loader__c=True;
    ld.SOSL_Queries__c=True;
    }
    else if(ld.admin__c||ld.Workflows__c||ld.Process_Builder__c||ld.force_com__c
            ||ld.SOQL__c||ld.Data_Loader__c||ld.SOSL_Queries__c){
    ld.SFDC_Configuration__c=True;
    }
    
    if(ld.Lightning__c){
    ld.Lightning_Web_Component__C=True;
    ld.Lightning_Design_system__c=True;
    ld.Aura_Framework__c=True;
    ld.Server_Side_Controllers__c=True;
    ld.Java_Script_Controllers__C=True;
    }
    else if(ld.Lightning_Web_Component__C ||  ld.Lightning_Design_system__c || ld.Aura_Framework__c
            ||ld.Server_Side_Controllers__c||ld.Java_Script_Controllers__C){
    ld.Lightning__c=True;
    }
    if(ld.Integration__C){
        ld.REST__c=True;
        ld.SOAP__c=True;
       }
    else if(ld.REST__c || ld.SOAP__c){
        ld.Integration__c = True;
    }
    
    if(ld.SFDC_Customization__c){
        ld.Triggers__c=True;
        ld.Apex_Class__c=True;
        ld.Visualforce_Pages__c=True;
        ld.batch_apex__C=True;
        ld.Schedule_Apex__c=True;        
    }
    else if(ld.Triggers__c || ld.Apex_Class__c || ld.Visualforce_Pages__c ||
           ld.Batch_Apex__c || ld.Schedule_Apex__c){
               ld.SFDC_Customization__c=True;        
    } 
}
}