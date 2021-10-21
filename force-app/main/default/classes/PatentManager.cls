public class PatentManager {
    public void newPatent(){
        try{
            List<Patent__c> patentList = new List<Patent__c>();
            patentList.add(new Patent__c(name='Time Machine', Application_No__c='AP-000001', Filing_Date__c=date.parse('15/07/2019'), Country_Code__c='US'));
            patentList.add(new Patent__c(name='Adrishya Choga', Application_No__c='AP-000002', Filing_Date__c=date.parse('12/08/2019'), Country_Code__c='IN'));
            patentList.add(new Patent__c(name='Gilbert Ring', Application_No__c='AP-000003', Filing_Date__c=date.parse('16/09/2019'), Country_Code__c='AU'));
            patentList.add(new Patent__c(name='Human Accelerator', Application_No__c='AP-000004', Filing_Date__c=date.parse('19/10/2019'), Country_Code__c='US'));
            patentList.add(new Patent__c(name='Portable House', Application_No__c='AP-000005', Filing_Date__c=date.parse('20/01/2020'), Country_Code__c='IN'));
            if(Schema.sObjectType.Patent__c.isCreateable()){
        	    insert patentList;
            }
        }catch(Exception e){
            System.debug('Insertion failed: Something went wrong');
        }
    }
    public void updatePatent(id pid){
        try{  Patent__c p;
            if(Schema.sObjectType.Patent__c.fields.id.isAccessible() && Schema.sObjectType.Patent__c.fields.Country_Code__c.isAccessible())
            {
                p= [select id, Country_Code__c from Patent__c where id = :pid];
            }
            if(Schema.sObjectType.Patent__c.fields.Country_Code__c.isUpdateable())
            {
                p.Country_Code__c= 'IN';
                update p;    
            }
            
        }catch(Exception e){
            System.debug('Updation failed: Something went wrong');
        }
    }
}