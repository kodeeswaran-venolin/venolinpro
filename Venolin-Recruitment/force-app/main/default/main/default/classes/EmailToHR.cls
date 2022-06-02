public class EmailToHR {         
    //@InvocableMethod
    public static list<Candiate__c> Candidates(){
        list<Candiate__c> CanList = new list<Candiate__c>();
        list<String> IntStatus = new string[] {'L1 Selected','Selected'};
            list<Candiate__c> SelectedCandidates =  [Select First_name__c, Interview_Status__c 
                                                     FROM Candiate__c
                                                     WHERE Interview_Status__c IN :IntStatus ];  
        for(Candiate__c can : SelectedCandidates){
            CanList.add(can);
        }
        return CanList;
    }  
    @InvocableMethod
    Public static void HREmail(){
        //list<IndividualEmail__c> em = IndividualEmail__c.getall().values();
        EmailTemplate tempId = [Select id, name, body,HTMLvalue From EmailTemplate Where name='EmailtoHR'];
        String emailBody = tempId.HTMLValue;
        integer NoCandidates = Candidates().size();
        emailbody = emailbody.replace('Selected_Candidtates', string.valueof(NoCandidates));
        IndividualEmail__c InEmail = IndividualEmail__c.getInstance('VenolinTalent Acquisition Group');
        
        //IndividualEmail__c InEmail = IndividualEmail__c.getvalues('VenolinTalent Acquisition Group');
        system.debug(InEmail);
        string hrEmail = string.valueOf(InEmail.Email__c);
        //string hrEmail = InEmail.Email__c;
        if (hrEmail != Null){
            String[] toAddresses = new String[] {hrEmail,'hr@venolin.com'};
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateID(tempId.id);
            mail.setToAddresses(toAddresses);
            mail.setSubject('selected candidates');
            mail.setPlainTextBody(NoCandidates + 'Candidates are selected');
            mail.setHtmlBody(emailbody);
            messaging.sendEmail(new Messaging.SingleEmailMessage [] {mail});           
        }
    }
}