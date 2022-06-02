@isTest
public class TestEmailToHR {
    @isTest public static void testMail (){
         IndividualEmail__c cust = new IndividualEmail__c();
         cust.Email__c = 'sacgaze@gmail.com';
         cust.Name = 'VenolinTalent Acquisition Group';
         insert cust;
        Position__c pos2 = new Position__c();
            pos2.TechnicalSkils__c = 'Salesforce';
            pos2.YearsOfExperience__c = '1 Year';
            pos2.NumberOfPositions__c = 2;
            pos2.SkillSet__c = 'Sales Cloud';
        	pos2.SubSetOfSkills__c = 'Admin';
            pos2.Role__c = 'Developer';
            //pos1.RelatedCandidate__c = canp.id;
        	insert pos2;
       list<Candiate__c> Candidates = new list<Candiate__c>();
        for (integer i=0; i<5; i++){
            Candidates.add(new Candiate__c(First_Name__c = 'Nikhil',
                                           Last_Name__c = 'Rao',
                                           Mobile_No__c = '98773339402',
                                           Current_Employer__c = 'TCS',
                                           Current_Employment__c = 'permanent',
                                           CTC__c = 30000,    
                                           Position_Object__c = pos2.id,
                                           Status__c = 'Scheduled',
                                           Email_ID__c = 'test@gmail.com',
                                           Ready_for_Contract__c = 'Yes',
                                           Communication__c = '8',
                                           Hands_on_JD__c = '7',
                                           Knowledge__c	 = '7',
                                           Expected_CTC__c = 40000,
                                           Interview_Status__c = 'L1 Selected'));
        }
        insert Candidates;
    }
    @isTest 
    static void testEmail(){
        Test.startTest();
        IndividualEmail__c cust = new IndividualEmail__c();
         cust.Email__c = 'sacgaze@gmail.com';
         cust.Name = 'VenolinTalent Acquisition Group';
         insert cust;
        EmailToHR.HREmail();
        Test.stopTest();
    }
}