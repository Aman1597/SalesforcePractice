public with sharing class TreeData {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getTreeData() {
        return [Select id, name, AccountNumber, Industry, (Select id, name, Birthdate, Department, MobilePhone from Contacts) from Account];
    }

    // @AuraEnabled(cacheable=true)
    // public static List<AccountWrapper> getTreeData(){
    //     List<Account> accs = [Select id, name, AccountNumber, Industry, (Select id, name, Birthdate,Department,MobilePhone from Contacts) from Account];
    //     List<AccountWrapper> aooo = new List<AccountWrapper>();
    //     for(Account a : accs){
    //         Map<String, Object> aKeyExtractor = a.getPopulatedFieldsAsMap();
    //         //List<String> accKeys = new List<String>(aKeyExtractor.keySet());
    //         AccountWrapper aWraper = new AccountWrapper() ; 
    //         aWraper.name =a.Name ;
    //         aWraper.label =a.Name ;
    //         aWraper.expanded =true ;
    //         aWraper.href = '/' + a.Id;
    //         List<Items> accInfo = new List<Items>();
    //         for(String accKey : aKeyExtractor.keySet()){
    //             if(accKey == 'Name' || accKey == 'Id'){}
    //             else if(accKey == 'Contacts'){
    //                 Items info = new Items();
    //                 info.name = accKey;
    //                 info.label = accKey;
    //                 info.expanded = false;
    //                 List<Items> conList = new List<Items>();
    //                 for(Contact c : a.Contacts){
    //                     Map<String, Object> cKeyExtractor = c.getPopulatedFieldsAsMap();
    //                     //List<String> conKeys = new List<String>(cKeyExtractor.keySet());
    //                     Items conWrapp = new Items();
    //                     conWrapp.name =c.Name ;
    //                     conWrapp.label =c.Name ;
    //                     conWrapp.expanded = false ;
    //                     conWrapp.href = '/' + c.Id ;
                    
    //                     List<Items> conInfo = new List<Items>();
    //                     for(String conKey : cKeyExtractor.keySet()){
    //                         if(conKey == 'Name' || conKey == 'Id' || conKey == 'AccountId'){}
    //                         else{
    //                             Items cInfo = new Items();
    //                             cInfo.name = cKeyExtractor.get(conKey).toString();
    //                             cInfo.label = cKeyExtractor.get(conKey).toString();
    //                             //cInfo.label = String.valueof(cKeyExtractor.get(conKey));
    //                             conInfo.add(cInfo);
    //                         }
    //                     }
                        
    //                     conWrapp.items = conInfo;
    //                     conList.add(conWrapp);
    //                 }
    //                 info.items = conList;
    //                 accInfo.add(info);
    //             }
    //             else{
    //                 Items info = new Items();
    //                 info.name = aKeyExtractor.get(accKey).toString();
    //                 info.label = aKeyExtractor.get(accKey).toString();
    //                 accInfo.add(info);
    //             }
    //         }
            
    //         aWraper.items = accInfo;
    //         aooo.add(aWraper);
            
    //     }
    //    return aooo;
    // } 
    // public Class AccountWrapper{
    //     @AuraEnabled
    //     public String name{get;set;}
    //     @AuraEnabled
    //     public String label{get;set;}
    //     @AuraEnabled
    //     public String href{get;set;}
    //     @AuraEnabled
    //     public Boolean expanded{get;set;}
    //     @AuraEnabled
    //     public List<Items> items{get;set;}
        
    // }
    // public Class Items{
    //     @AuraEnabled
    //     public String name{get;set;}
    //     @AuraEnabled
    //     public String label{get;set;}
    //     @AuraEnabled
    //     public String href{get;set;}
    //     @AuraEnabled
    //     public Boolean expanded{get;set;}
    //     @AuraEnabled
    //     public List<Items> items{get;set;}
    // }
    
}