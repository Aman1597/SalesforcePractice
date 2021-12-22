trigger BulkInsertAccountTrigger on Account (after insert) {
	List<Account> AccList = new List<Account>();
    Integer i = 1;
    
    // Necessary for After insert to avoid Read Only exception
    List<Account> newAccs = [SELECT Id FROM Account WHERE Id IN :Trigger.New];
    for(Account a : newAccs){
        a.Description = 'Description changed by trigger after insert '+i;
        AccList.add(a);
        i++;
    }
    update AccList;
}
//bulk