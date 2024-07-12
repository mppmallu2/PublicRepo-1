public class selected {
    Public map<string,Schema.SObjectType> resMap;
    public selected(string a,string b){
       resMap=schema.getGlobalDescribe();
        system.debug(resMap.size());
    }
    
}