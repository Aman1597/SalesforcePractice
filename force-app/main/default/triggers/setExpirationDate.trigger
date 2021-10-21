trigger setExpirationDate on Patent__c (before insert,before update) {
    for(Patent__c pt : Trigger.New){
        if(pt.Country_Code__c == 'US' || pt.Country_Code__c == 'IN'){
            pt.Expiration_Date__c = pt.Filing_Date__c.addYears(20);
        }else if(pt.Country_Code__c == 'AU'){
            pt.Expiration_Date__c = pt.Filing_Date__c.addYears(15);
        }        
    }
}