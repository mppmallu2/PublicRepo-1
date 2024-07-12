public class mp_scrap {
    integer a;
    public mp_scrap(integer var){
        this.a=var;
    }
    public mp_scrap(){
    }
      Public static void method(){
          try{ List<account> accList=[select Id,name from Account where name='MPKbukhuiuLIO'];
              system.debug(accList.size());
             }catch(QueryException nn){
                 system.debug('error message:'+nn.getLineNumber());
                 system.debug('error message:'+nn.getMessage());
             }
          system.debug('end');
    }
    Public Static Void method1(integer num){
        mp_scrap m = new mp_scrap();
        if(m.a==num){
            system.debug('yes both parameters are equal');
        }else throw new mp_Exception('mp');
        Account acc=new Account(Name='Mp_Test');
        insert acc;
        attachment at=new attachment();
        at.name='mp_attachment_test.txt';
        at.ParentId=acc.id;
        at.Body=blob.valueof('mp date 15th APril 20204');
        insert at;
    }
    
}