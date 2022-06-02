({
	doInit : function(component, event, helper) {
		var action = component.get("c.ListOfMatches");

    action.setParams({ posId: component.get("v.recordId") });
    $A.enqueueAction(action);
        action.setCallback(this, function(response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        var records = response.getReturnValue();
       	records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
        component.set("v.candidates", records);
      } else {
        alert("Something is wrong !");
      }
    });
        component.set("v.myColumns", [
      { label: "First Name", fieldName: "First_Name__c", type: "text"},
      { label: "Email", fieldName: "Email_ID__c", type: "text" },
      { label: "Candidate Id", fieldName: "Id", type: "url", typeAttributes: {label: { fieldName: 'Id' }, target: '_blank'} }
    ]);
	},
    
    updateSelectedText: function(component, event, helper) {
        
    var selectedRows = event.getParam("selectedRows");
	
    var selectedArrayOfRecord = [];
    for (var i = 0; i < selectedRows.length; i++) {
      selectedArrayOfRecord.push(selectedRows[i].Id);
    }
    component.set("v.selectionCandidate",selectedArrayOfRecord);
  },
    
    handleClick: function(component, event, helper) {
        
        var action = component.get("c.assignCandidatToPosition");
   		var canIdList = component.get("v.selectionCandidate");
        var pId = component.get("v.recordId");
        action.setParams(
            { 
                cand: canIdList,
                posId: pId
                
            }
        );   
        alert("fire")
        $A.enqueueAction(action);
  },
    statusOfL1Selected : function(component, event, helper) {
	
        var action=component.get('c.l1Selected');
        
        action.setParams(
                       {
                           posId : component.get("v.recordId")
                       });
        $A.enqueueAction(action);
       	action.setCallback(this,function(response)
                          {
                              var state=response.getState();
                              var L1Selected= response.getReturnValue();
                              if(state=='SUCCESS')
                              {
                                  alert('data is fetched Successfully !');
                                  
                                  component.set("v.L1Selected",L1Selected);
                              }
                              else
                              {
                                  alert('Something is wrong !');
                              }
                          });
	},
    statusOfSelected : function(component, event, helper) {
	
        var action=component.get('c.selected');
        
        action.setParams(
                       {
                           posId : component.get("v.recordId")
                       });
        $A.enqueueAction(action);
       	action.setCallback(this,function(response)
                          {
                              var state=response.getState();
                              var Selec= response.getReturnValue();
                              if(state=='SUCCESS')
                              {
                                  alert('data is fetched Successfully !');
                                  
                                  component.set("v.Selected",Selec);
                              }
                              else
                              {
                                  alert('Something is wrong !');
                              }
                          });
	}
	
    
})