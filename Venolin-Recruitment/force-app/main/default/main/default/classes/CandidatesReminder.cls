global class CandidatesReminder implements Database.Batchable<SObject>, Database.Stateful{
    global integer ScheduledCandidates = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator([Select ID, First_Name__c,Last_Name__c,InterviewSchedule__c
                                         From Candiate__c 
                                         where InterviewSchedule__c != null]);
    }
    global void execute (Database.BatchableContext BC, List<Candiate__c> scope){
        ScheduledCandidates += scope.size();
        
    }
    
    global void finish(Database.BatchableContext BC){
        EmailTemplate tempId = [Select id, name, body,HTMLvalue From EmailTemplate Where name='NoOfCandidatesScheduledForINterview'];
         String emailBody = tempId.HTMLValue;
        /*string htmlBody = '';
         list<Candiate__c> SCIntCan = new list<Candiate__c>();
        list<Candiate__c> canLst = [select id, name from Candiate__c where Candiate__c.Status__c = 'Scheduled'];
        htmlBody = '<table border="1" style="border-collapse:collapse"><caption></caption><tr><th>Candiate__c</th><th>url</th></tr>';
        for(Candiate__c can : canLst){
            string Name = can.First_Name__c;  
            //string url = '<a href ="https://venolin--recruitmen.lightning.force.com/lightning/o/Candiate__c/{!can.Id}/view?0.source=alohaHeader">';
            htmlBody = '<tr><td>' + Name +  '</td></tr>';         //'</td><td>' + url +
        }
        htmlBody +='</table>';  
        system.debug(SCIntCan);*/
        emailbody = emailbody.replace('candidates_scheduled', string.valueof(ScheduledCandidates));
        IndividualEmail__c InEmail = IndividualEmail__c.getvalues('HR');
        string hrEmail = InEmail.Email__c;
        system.debug(hrEmail);
        String[] toAddresses = new String[] {hrEmail};
            messaging.singleEmailmessage mail = new messaging.singleEmailmessage();
        mail.setToAddresses(toAddresses);
        mail.setSubject('Candidates');
        mail.setPlainTextbody('No of candidates scheduled for interview is '  + ScheduledCandidates); 
        mail.setHtmlBody(emailBody);
        messaging.sendEmail(new messaging.singleEmailmessage[] {mail});
    }                               
}