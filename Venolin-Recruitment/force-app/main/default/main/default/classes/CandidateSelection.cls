public class CandidateSelection {
@AuraEnabled
    public static Integer l1Selected(id posId){
        Integer result =[SELECT count() FROM CandidateJoinPosition__c WHERE CandidateJoinPosition__c.Candidate__r.Interview_Status__c = 'L1 Selected' and 
						CandidateJoinPosition__c.Position__c=:posId];
        return result;
    }
    @AuraEnabled
    public static Integer selected(id posId){
        Integer result = [SELECT count() FROM CandidateJoinPosition__c WHERE CandidateJoinPosition__c.Candidate__r.Interview_Status__c = 'Selected' and 
						CandidateJoinPosition__c.Position__c=:posId];
        return result;
    }
    
    @AuraEnabled    
    public static List<Candiate__c> ListOfMatches(id posId){
          String   multiSkillSet='';
          String  technical='';         
         
        
        Position__c posObj = [SELECT SkillSet__c,TechnicalSkils__c FROM Position__c where id=:posId];
        
              multiSkillSet = posObj.SkillSet__c;
              technical=posObj.TechnicalSkils__c;  
            
        
       	 List<Candiate__c> mat=[SELECT Email_ID__c,Id,Name,First_Name__c,Technical_skills__c  FROM Candiate__c
         	WHERE Technical_skills__c = :technical AND SkillSet__c includes (:multiSkillSet) ];
            return mat;     
            
    					}
     @AuraEnabled    
    public static void assignCandidatToPosition(List<Id> cand, Id posId){
        List<CandidateJoinPosition__c> cJP = new List<CandidateJoinPosition__c>();
        System.debug('inside method'+cand.size());
        for (Integer i = 0; i < cand.size(); i++) {
            	CandidateJoinPosition__c canJoinPos = new CandidateJoinPosition__c();
      			canJoinPos.Candidate__c=cand[i]; 
            	
           
            	canJoinPos.Position__c=posId;      
            
            	cJP.add(canJoinPos);
    		}
        insert cJP;
        
    }
    @AuraEnabled    
    public static List<CandidateJoinPosition__c> listOfCandidatePosition(Id posId){
        return [SELECT Candidate__r.Name, Candidate__r.First_Name__c, Candidate__r.Email_ID__c FROM CandidateJoinPosition__c where Position__c=:posId];
    }
    
}