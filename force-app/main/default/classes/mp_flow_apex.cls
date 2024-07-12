public class mp_flow_apex {
    @invocablemethod(label='Accept Account Id and Names' Description='Input WRPCLASS output ' category='Account')
    public static list<Opportunity>	 flowMethod(List<input> wrpClass){
        List<Id> ids=wrpClass[0].input1;
        List<String> names=wrpClass[0].input2;
        system.debug(names.size());
            system.debug(ids.size());
        List<Opportunity> oppList=[select Id,Name,Amount,Account.Id from Opportunity  limit 6 ];
        // List<list<output>> outlist=new List<list<output>>();
        list<output> oulist=new list<output>();
        for(Opportunity opt:oppList){
            output out=new output();
            
            if(opt.AccountId !=null && opt.Amount!=null && opt.Name !=null){
                out.output1=new List<String>{opt.Name};
                    out.output2=new List<Decimal>{opt.Amount};
                        }
            oulist.add(out);
        }
        // outlist.add(oulist);
        Return oppList;
        
        
    }
    
    Public Class input{
        @invocableVariable
        Public List<id> input1;
        @invocableVariable
        Public List<string> input2;
    }
    
    Public Class output{
        @invocableVariable
        Public  List<string> output1;
        @invocableVariable
        Public  List<Decimal> output2;
    }
    
}