public class dataTableConNew {

    List<Position__c> Positions;

    public List<Position__c> getPositions() {
        if(Positions == null)
            Positions = [SELECT name,(select name from Job_Applications__r)FROM Position__c];
        return Positions;
    }
}