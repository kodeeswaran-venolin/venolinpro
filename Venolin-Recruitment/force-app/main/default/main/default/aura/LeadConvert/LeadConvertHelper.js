({
	leadUpdate : function(component,event,helper) {
		var recordId = component.get("v.recordId");
        console.log('********'+recordId);
        var action = component.get("c.updateLeadDetails");
        action.setParams({"leadId": recordId});

        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('state---'+state);
            if(component.isValid() && state == "SUCCESS"){
                var resp = response.getReturnValue();
                console.log('response ----'+resp);   
                component.set("v.message",resp);
                if(resp==='SUCCESS'){
                    component.set("v.message",'Your Lead is successfully converted');
                    component.set("v.successCheck",true);
                }
                else if(resp==='ERROR'){
                    component.set("v.message",'Your Lead conversion is failed, Please fill all the mandatory fields and try again');
                    component.set("v.errorCheck",true);
                }
                
                
            } else {
                  var resp = response.getReturnValue();
                console.log(' error response : '+resp);
                console.log('There was a problem : '+response.getError());
            }
        });
        $A.enqueueAction(action);
	}
})