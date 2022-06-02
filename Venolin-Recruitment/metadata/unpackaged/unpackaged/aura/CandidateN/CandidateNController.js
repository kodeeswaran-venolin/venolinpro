({
	doInit : function(component, event, helper) {
		   var recId=component.get("v.recordId");
     		var action = component.get("c.listOfCandidatePosition");
    	action.setParams({ posId: recId });
    	
       action.setCallback(this, function(response)
                           {
                               var state=response.getState();
                               if(state=='SUCCESS')
                               {
                                   component.set('v.CandidateList',response.getReturnValue());
                               }
                               else
                               {
                                   alert('Something is wrong !');
                               }
                           });
        $A.enqueueAction(action);
	}
})