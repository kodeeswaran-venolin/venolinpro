@isTest
public class TestCandidatesReminder {
    @testSetup public static void canReminderTest(){
        IndividualEmail__c cust = new IndividualEmail__c();
         cust.Email__c = 'sacgaze@gmail.com';
         cust.Name = 'HR';
         insert cust;
        Position__c pos2 = new Position__c();
            pos2.TechnicalSkils__c = 'Salesforce';
            pos2.YearsOfExperience__c = '1 Year';
            pos2.NumberOfPositions__c = 2;
            pos2.SkillSet__c = 'SFDC Configuration';
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
                                           Expected_CTC__c = 40000,
                                           Status__c = 'ScreenReject',
                                           InterviewSchedule__c = date.today()));
        }
    }
    @isTest
    static void testcanR(){
        Test.startTest();
        CandidatesReminder cdr = new CandidatesReminder();
        database.executeBatch(cdr);
        Test.stopTest();
    }
}