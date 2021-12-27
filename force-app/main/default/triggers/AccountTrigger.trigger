trigger AccountTrigger on Account (before insert, after insert,
                                  before update, after update,
                                  before delete, after delete,
                                  after undelete) {
      if(trigger.isBefore){
          if (trigger.isInsert){
              system.debug('Before Insert Trigger');
          } else if(trigger.isUpdate){
              system.debug('Before Update Trigger');
          } else if(trigger.isDelete){
              system.debug('Before Delete');
          }                      
      }else{
          if (trigger.isInsert){
              system.debug('After Insert Trigger');
          } else if(trigger.isUpdate){
              system.debug('After Update Trigger');
          } else if(trigger.isDelete){
              system.debug('After Delete');
          } else if(trigger.isUndelete){
              system.debug('After Undelete');
          }                      
      }
}
//cng2