@isTest
public class OppNameConcate_Test {
    public static testMethod void Method1()
    {
        List<Account> listAcc = new List<Account>();
        Account a = new Account();
        a.Name = 'Venolearn';
        listAcc.add(a);
        
        Account b = new Account();
        b.Name = 'Testtttttttttttt';
        listAcc.add(b);
        insert listAcc;
        
        
        List<Opportunity> listOpp = new List<Opportunity>();
        Opportunity o = new Opportunity();
        o.Working_Month__c=system.today();
        o.AccountId=a.Id;
        String str=o.AccountId;
        
        date d = system.today();
        Integer i = d.day();
        o.Name='Test1'+a.Name+str+i+ o.Opportunity_Month__c+o.Opportunity_Year__c;
        o.StageName='Closed Won';
        o.CloseDate=system.today();
        listOpp.add(o);
        
        Opportunity op = new Opportunity();
        op.Working_Month__c=system.today();
        op.AccountId=b.Id;
        date da = system.today();
        Integer n = da.day();
        op.Name='Test1'+b.Name+op.AccountId+n+op.Opportunity_Month__c+op.Opportunity_Year__c;
        op.StageName='Closed Won';
        op.CloseDate=system.today();
        listOpp.add(op);
        
        insert listOpp;
    }
}