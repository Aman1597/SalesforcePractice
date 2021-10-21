({
	handleClick : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        
        action.setCallback(this, function(response){
            const state = response.getState();
            
            if(component.isValid() && state == "SUCCESS"){
                component.set("v.accts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})