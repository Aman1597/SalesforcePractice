public class PositionManager {
    
    private static Integer totalPositions;
    static{
        //Code to initialize totalPositions
    }
    public boolean createPosition(String posName, String jobDes){
        Position__c pos = new Position__c(name = posName);
        pos.Job_Description__c = jobDes;
        insert pos;
        return true;
    }
    public boolean updatePosition(String posId, String startDate){
        Position__c pos = new Position__c();
        pos.id = posId;
        pos.Start_Date__c = date.parse(startDate);
        update pos;
        return true;
    }
    
    //Deleting position record by accepting Id
    public boolean deletePosition(id posId){
        Position__c pos = new Position__c();
        pos.id = posId;
        delete pos;
        return true;
    }
    public boolean undeletePosition(id posId){
        Position__c pos = new Position__c();
        pos.id = posId;
        undelete pos;
        return true;
    }
    
    public List<Job_Application__c> getAllJobApplications(Id recId){
        Position__c pos = [select name, (select name from Job_Applications__r) from Position__c where id = :recId];
        return pos.Job_Applications__r;
    }
}