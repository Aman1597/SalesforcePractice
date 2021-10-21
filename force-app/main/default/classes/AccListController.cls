public class AccListController {
	@AuraEnabled
    public static List<Account> fetchAccts() {
        return [Select Id, Name, Industry, Type from Account];
    }
}