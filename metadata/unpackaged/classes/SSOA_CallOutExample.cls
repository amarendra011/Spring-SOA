/**
@author: Amarendra Kumar
@company: Spring SOA
@description: Call out example
**/
public class SSOA_CallOutExample {
    
    @future(callout=true)
    public static void callOut()
    {   
        Http httpObj = new Http();  
        HttpRequest req = new HttpRequest();
        req.setMethod('GET'); 
        req.setEndpoint('callout:SpringSOA');
        HTTPResponse httpRes = httpObj.send(req); 
        String jsonResponse_Body = httpRes.getBody(); 
        system.debug(jsonResponse_Body);
    }
    
}