trigger SSOA_TriggerOnContact on Contact (after insert, after update, after delete ,after undelete) {
    
    SSOA_TriggerOnContactHandler ssoaHandler = new SSOA_TriggerOnContactHandler();
    if(Trigger.isInsert && Trigger.isAfter){
        ssoaHandler.afterInsert( Trigger.new);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter){
        ssoaHandler.afterUpdate( Trigger.new,Trigger.old);
    }
    
    if(Trigger.isDelete && Trigger.isAfter){
        ssoaHandler.afterDelete( Trigger.old);
    }
    
    if(Trigger.isUndelete && Trigger.isAfter){
        ssoaHandler.afterUnDelete( Trigger.new);
    }
}