public with sharing class VSCode {
    public VSCode() {

    }
    public Id newRecord(String recName){
        Contact c= new Contact(lastName=recName);
        insert c;
        return c.Id;
    }
}