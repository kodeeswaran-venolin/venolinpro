trigger OppNameConcate on Opportunity (before insert,before update) {
    Set<Id> accountIds = new Set<Id>();
	for(Opportunity c : trigger.new) {
        if(c.AccountId !=Null){
            accountIds.add(c.AccountId);
        }
    }
	if (accountIds.size() > 0 && trigger.isbefore && trigger.isinsert){
		Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :accountIds]);
		for (Opportunity c : trigger.new){
            date d = c.Working_Month__c;
            Integer i = d.day();
                String str = accountMap.get(c.AccountId).Name;
                If(str.length()<=10)
                {
			    	c.Name = c.Name+' | '+str+' | '+ i +' | '+c.Opportunity_Month__c+' | '+c.Opportunity_Year__c;
            	} 
            	else
            	{
               		c.Name = c.Name +' | '+str.substring(0,10) +' | '+ i +' | '+c.Opportunity_Month__c+' | '+c.Opportunity_Year__c;
            	}
        }
	}
}