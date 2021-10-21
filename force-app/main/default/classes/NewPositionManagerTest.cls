@isTest
private class NewPositionManagerTest {
	private static NewPositionManager pm = new NewPositionManager();
    private static Id recId = null;
    
    @testSetup
    private static void setup(){
        Position__c pos = new Position__c(name = 'Network Admin', Job_description__c='Fresher');
        insert pos;
        recId = pos.Id;
        system.debug('Record Id1- ' + recId);
    }
    
    private static testMethod void testNewPosition(){
        Id actualRecId = pm.newPosition('Network Administrator', '10 yrs experience');
        system.assertNotEquals(null, actualRecId, 'Record not created');
        system.debug('Record Id2- ' + actualRecId);
    }
    
    private static testMethod void testmodifyPositionDescription(){
        Position__c position = [select id from Position__c where name = 'Network Admin' limit 1];
        system.debug('Record Id3- ' + position.Id);
        system.debug('Record Id4- ' + recId);
        Boolean result = pm.modifyPositionDescription( position.Id, 'New Description');
        system.assert(result, 'Position not modified');
    }
}