({
 fetchAccounts : function(component, event, helper) {
  component.set('v.mycolumns', [
                      {label: 'Account Name', fieldName: 'Name', type: 'text', sortable: true},
                      {label: 'Industry', fieldName: 'Industry', type: 'text'},
                      {label: 'Type', fieldName: 'Type', type: 'text'}
                     ]);
        var fetchAccts = component.get("c.fetchAccts");
        
        fetchAccts.setParams({ 
        });
        
        fetchAccts.setCallback(this, function(response) {
         var state = response.getState();
         if(state === "SUCCESS") {
             component.set("v.accList", response.getReturnValue());
             helper.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
         }
         });
        $A.enqueueAction(fetchAccts);
 },
    
    updateColumnSorting : function(component, event, helper){
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.sortData(component, fieldName, sortDirection);
    }
})