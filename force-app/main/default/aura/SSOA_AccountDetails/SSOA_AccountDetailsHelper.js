({
    doInitHelper : function(component, event) {
        var action = component.get("c.onLoadCall");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if ((state === "SUCCESS") && (component.isValid())) {
                var records = response.getReturnValue();
                var isError = records.isError;
                if (isError === false) {                   
                    component.set("v.Wrapperdata",records.accountList);
                    
                } else {
                   this.showToast("error", "Error!", $A
							.get("Error"));
                }
                
            } else if (state === "ERROR") {
               	 this.showToast("error", "Error!", $A
							.get("Error"));
            }
        });
        $A.enqueueAction(action);
        
        
    },
    showToast: function(type,title,message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({               
                "type": type,
                "title": title,
                "message": message
        });
        toastEvent.fire();
    },
})