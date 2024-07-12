@RestResource(urlMapping='/v/CreateAccount/*')
Global class mp_API_accountRestService {
    @HttpPost
    Global Static String doPost(){
        RestRequest req=RestContext.request;
        String jsonRes=req.requestBody.toString();
        system.debug(jsonRes);
        Account a=(Account)JSON.deserialize(jsonRes,Account.class);
        try{
            insert a;
            return 'Account created Success fully:'+a.Id;
        }
        catch(Exception ex){
            return ex.getMessage(); 
        }
    }
}