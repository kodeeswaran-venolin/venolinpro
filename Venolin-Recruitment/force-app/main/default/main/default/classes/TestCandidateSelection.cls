@isTest
public class TestCandidateSelection {
    @testSetup static void setup(){
         Position__c pos2 = new Position__c();
            pos2.TechnicalSkils__c = 'Salesforce';
            pos2.YearsOfExperience__c = '1 Year';
            pos2.NumberOfPositions__c = 2;
            pos2.SkillSet__c = 'SFDC Configuration';
            pos2.Role__c = 'Developer';
            //pos1.RelatedCandidate__c = canp.id;
        	insert pos2;
        list<Candiate__c> candidates = new list<Candiate__c>();
        Position__c pos = [select id from Position__c limit 1 ];
        candidates.add(new Candiate__c(First_Name__c = 'Nikhil',
                                       Last_Name__c = 'Rao',
                                       Mobile_No__c = '98773339402',
                                       Current_Employer__c = 'TCS',
                                       Current_Employment__c = 'permanent',
                                        SkillSet__c ='SFDC Configuration',
                                       CTC__c = 30000,    
                                       Technical_skills__c = 'Salesforce',
                                       Position_Object__c = pos.id,
                                       Ready_for_Contract__c = 'Yes',
                                       Interview_Status__c = 'L1 Selected',
                                       Expected_CTC__c = 40000,
                                       Status__c = 'Sourced'));
        candidates.add(new Candiate__c(First_Name__c = 'Vijay',
                                       Last_Name__c = 'Rao',
                                       Mobile_No__c = '98773339402',
                                       Current_Employer__c = 'TCS',
                                       SkillSet__c ='SFDC Configuration',
                                       Current_Employment__c = 'permanent',
                                       Interview_Status__c = 'Selected',
                                       Technical_skills__c = 'Salesforce',
                                       CTC__c = 30000,    
                                       Position_Object__c = pos.id,
                                       Ready_for_Contract__c = 'Yes',
                                       Expected_CTC__c = 40000,
                                       Status__c = 'ScreenReject'));
        insert candidates;
        Candiate__c canp = [select id, name ,Interview_Status__c from Candiate__c where First_Name__c = 'Nikhil'];
        Candiate__c canp1 = [select id, name ,Interview_Status__c from Candiate__c where First_Name__c = 'Vijay'];
        
        /*Position__c pos1 = new Position__c();
            pos1.TechnicalSkils__c = 'Salesforce';
            pos1.YearsOfExperience__c = '1 Year';
            pos1.NumberOfPositions__c = 2;
            pos1.SkillSet__c = 'SFDC Configuration';
            pos1.Role__c = 'Developer';
            pos1.RelatedCandidate__c = canp.id;
        	insert pos1;*/
        CandidateJoinPosition__c obj = new CandidateJoinPosition__c();
        obj.Candidate__c=canp.id;
        obj.Position__c=pos2.id;
        insert obj;
        CandidateJoinPosition__c obj1 = new CandidateJoinPosition__c();
        obj1.Candidate__c=canp1.id;
        obj1.Position__c=pos2.id;
        insert obj1;
  	}
    
    @isTest public static void l1Selected(){
        list<Position__c> pos = [select id from Position__c where TechnicalSkils__c = 'Salesforce' limit 1 ];            
        Integer pri=CandidateSelection.l1Selected(pos[0].id);            
        System.assertEquals(1, pri);
    }
    @isTest public static void selected(){
        list<Position__c> pos = [select id from Position__c where TechnicalSkils__c = 'Salesforce' limit 1];                
        Integer pri=CandidateSelection.selected(pos[0].id);            
        System.assertEquals(1, pri);        
	}
    
    
    @isTest public static void ListOfMatc(){
       id pos = [select id from Position__c where TechnicalSkils__c = 'Salesforce' limit 1 ].id;
       List<Candiate__c> actual= CandidateSelection.ListOfMatches(pos);
       System.assertEquals(2, actual.size());        
     }
     @isTest public static void assignCandidatToPosit(){
          Position__c pos3 = new Position__c();
            pos3.TechnicalSkils__c = 'Salesforce';
            pos3.YearsOfExperience__c = '1 Year';
            pos3.NumberOfPositions__c = 2;
            pos3.SkillSet__c = 'SFDC Configuration';
            pos3.Role__c = 'Developer';
            //pos1.RelatedCandidate__c = canp.id;
        	insert pos3;
    	List<Id> candIde =new List<Id>();
        list<Candiate__c> candidates = new list<Candiate__c>();
         candidates.add(new Candiate__c(First_Name__c = 'Test1',
                                       Last_Name__c = 'test',
                                       Mobile_No__c = '98773339402',
                                       Current_Employer__c = 'TCS',
                                       Current_Employment__c = 'permanent',
                                        SkillSet__c ='SFDC Configuration',
                                       CTC__c = 30000,    
                                       Technical_skills__c = 'Salesforce',
                                       Position_Object__c = pos3.id,
                                       Ready_for_Contract__c = 'Yes',
                                       Interview_Status__c = 'L1 Selected',
                                       Expected_CTC__c = 40000,
                                       Status__c = 'Sourced'));
        candidates.add(new Candiate__c(First_Name__c = 'Test2',
                                       Last_Name__c = 'test',
                                       Mobile_No__c = '98773339402',
                                       Current_Employer__c = 'TCS',
                                       Current_Employment__c = 'permanent',
                                        SkillSet__c ='SFDC Configuration',
                                       CTC__c = 30000,    
                                       Technical_skills__c = 'Salesforce',
                                       Position_Object__c = pos3.id,
                                       Ready_for_Contract__c = 'Yes',
                                       Interview_Status__c = 'L1 Selected',
                                       Expected_CTC__c = 40000,
                                       Status__c = 'Sourced'));
         insert candidates;
         
         Position__c pos = [select id from Position__c where TechnicalSkils__c = 'Salesforce' limit 1];
         List<Candiate__c> c =[select id from Candiate__c where Candiate__c.Last_Name__c = 'test' ];
         
         for(Candiate__c ca : c){ 
             candIde.add(ca.id);
         }               	 
        CandidateSelection.assignCandidatToPosition(candIde, pos.id);         
         
    }
    @isTest public static void listOfCandidatePositi(){
        	Position__c pos = [select id from Position__c where TechnicalSkils__c = 'Salesforce'];
            List<CandidateJoinPosition__c> c=CandidateSelection.listOfCandidatePosition(pos.Id);
         }
}