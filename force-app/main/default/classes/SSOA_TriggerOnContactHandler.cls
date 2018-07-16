/**
@author: Amarendra Kumar
@company: Spring SOA
@description: Handler class for contact trigger
**/
public with sharing  class SSOA_TriggerOnContactHandler {
    
    public void afterInsert(List<Contact> contactList)
    {
        processData(contactList);
    }
    public void afterUpdate(List<Contact> contactList,List<Contact> contactOldList)
    {
        List<Contact> contactsList = new List<Contact>();       
        contactsList.addAll(contactList);
        contactsList.addAll(contactOldList);
        processData(contactsList);
    }
    public void afterDelete(List<Contact> contactList)
    {
        processData(contactList);
    }   
    public void afterUnDelete(List<Contact> contactList)
    {
        processData(contactList);
    }
    
    /**
    @author: Amarendra Kumar
    @company: Spring SOA
    @description: Common  method to process the data
    **/
    @TestVisible
    private void processData(List<Contact> contactList){
        
        Set<Id> acctIds = new Set<Id>();
        for (Contact contactObj : contactList) {
            if (contactObj.AccountId != null) {
                acctIds.add(contactObj.AccountId);
            }
        }
        
        List<Account> accountListToBeUpdated = new List<Account>();
        
        for (Account accountObj : [SELECT ID, SSOA_Number_of_Contacts__c , 
                                   (SELECT ID FROM Contacts) 
                                   contacts FROM Account where id in :acctIds])
        {
                                       
                                       if(accountObj.Contacts == null || accountObj.Contacts.size() == 0 ){
                                           accountObj.SSOA_Number_of_Contacts__c = 0;
                                           
                                           
                                       } else {
                                           accountObj.SSOA_Number_of_Contacts__c = accountObj.Contacts.size();
                                       }    
                                       accountListToBeUpdated.add(accountObj);
                                       
        }
        if(accountListToBeUpdated != null && !accountListToBeUpdated.isEmpty()){
            Database.update(accountListToBeUpdated);
        }
        
    }
}