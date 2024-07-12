public class mp_FlowApexMethod {
    Public class variable{
    @InvocableVariable
    Public List<integer> age;
    @InvocableVariable
    public List<string> name;
    }
    @invocablemethod (label='Flow accept argument' description='flow input and output')
    Public static List<variable> flowCall(List<Id> ids){
        List<variable> ad=new list<variable>();
        for(integer i=0;i<10;i++){
            ad[0].age.add(i);
        }
        list<string> str=new List<string>{'a','b','c','d','e'};
            ad[1].name.addall(str);
        for(id idf:ids){
            system.debug(idf);
        }
        return ad;
    }

}