@isTest
public class Test_Leadcontroller {
    Public static testmethod void testlead(){
    Lead__c ld=new lead__c();
        ld.Last_Name__c='Test2';
        ld.Name='test2';
        ld.Email__c='moah@gmail.com';
        ld.SFDC_configuration__c=True;
        ld.SFDC_Customization__c=True;
        ld.Lightning__c=True;
        ld.Integration__c=True;
        ld.Admin__c=True;
    insert ld;
        Test.startTest();
        	LeadController.updateLeadDetails(ld.Id);
        Test.stopTest();
        ld.SFDC_Configuration__c=False;
        ld.Lightning__c=False;
        ld.Integration__c=False;
        ld.SFDC_Customization__c=False;
        update ld;
        
    }
    
}