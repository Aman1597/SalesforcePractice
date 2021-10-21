public with sharing class getContacts {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(){
        return [Select id, name,AccountId,Account.name,Birthdate,Department,MobilePhone from Contact];
    }
}