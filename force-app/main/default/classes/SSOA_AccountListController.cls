/**
@author: Amarendra Kumar
@company: Spring SOA
@description: Controller class for account list
**/
public with sharing  class SSOA_AccountListController {
    
    @AuraEnabled
    public static SSOA_AccountWrapper.WrapperData onLoadCall() {
        
        SSOA_AccountWrapper.WrapperData obj = new SSOA_AccountWrapper.WrapperData ();
        try{
            List<Account> accountList = [Select Active__c,SSOA_Number_of_Contacts__c,SLA__c 
                                         from Account order by LastModifiedDate  desc limit 10];
            obj.accountList = accountList ;
            obj.isError = false ;
        }catch(Exception exce){
            obj.isError = true ;
        }
        return obj ;
    }    
}