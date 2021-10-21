public class LightningAccountManager {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [select name, type, id from Account];
    }
}