@isTest
public class TestRejectedbatchandSchedule{
    @isTest static void testDeleteschedule (){
        Position__c pos1 = new Position__c();
        pos1.TechnicalSkils__c = 'Salesforce';
        pos1.YearsOfExperience__c = '1 Year';
        pos1.NumberOfPositions__c = 2;
        pos1.SkillSet__c = 'SFDC Configuration';
        pos1.Role__c = 'Developer';
        //pos1.RelatedCandidate__c = canp.id;
        insert pos1;
        list<Candiate__c> Candidates = new list<Candiate__c>();
        for (integer i=0; i<5; i++){
            Candidates.add(new Candiate__c(First_Name__c = 'Nikhil',
                                           Last_Name__c = 'Rao',
                                           Mobile_No__c = '98773339402',
                                           Current_Employer__c = 'TCS',
                                           Ready_for_Contract__c = 'Yes',
                                           Current_Employment__c = 'permanent',
                                           CTC__c = 30000,    
                                           Position_Object__c = pos1.id,
                                           Expected_CTC__c = 40000,
                                           Status__c = 'ScreenReject'));
        }
        insert Candidates;
        string cr = '0 0 15 * * ?';
        Test.startTest();
        CandidatesSchedule scDelete = new CandidatesSchedule ();
        
        string jobId = system.schedule('DeleteSchedule', cr, scDelete);
        scDelete.execute(null);
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(cr, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();
    }
    
    @isTest public static void tesbatch(){
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
                                           Ready_for_Contract__c = 'Yes',
                                           Current_Employment__c = 'permanent',
                                           CTC__c = 30000,    
                                           Position_Object__c = pos2.id,
                                           Expected_CTC__c = 40000,
                                           Status__c = 'ScreenReject'));
        }
        insert Candidates;
    }
    
    @isTest 
    static void test(){
        Test.startTest();          
        DeletScreenRejectedCandidates batch = new DeletScreenRejectedCandidates ();
        database.executeBatch(batch);
        Test.stopTest();
        system.assertEquals(0, [select count() from Candiate__c where Status__c = 'ScreenReject']);
    }
}