/**
@author: Amarendra Kumar
@company: Spring SOA
@description: Wrpper class for accountlist
**/
public class SSOA_AccountWrapper {

    /**
    @author: Amarendra Kumar
    @company: Spring SOA
    @description: Inner Wrpper class for accountlist
    **/
    public class WrapperData{
        @AuraEnabled public List<Account> accountList{get;set;}
        @AuraEnabled public Boolean isError{get;set;}
    }
}