public class AccountBulkDML {
    public static void addAccounts(Integer n){
        List<Account> AccList = new List<Account>();
        for(Integer i=1; i<=n; i++){
            String s= 'Test Account '+i;
            AccList.add(new Account(name = s));
        }
        insert AccList;
    }
    
    public static void deleteAccounts(){
        delete [SELECT Id FROM Account where name Like 'Test Account%'];
    }
}