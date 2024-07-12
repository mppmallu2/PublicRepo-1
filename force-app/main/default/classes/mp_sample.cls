public class mp_sample {
    Public static void fut(){
        contact cc=new contact();
        cc.firstname='mp future dml';
        cc.LastName='mp last name dml future method';
        insert cc;
    }
    
    Public static void met(){
        List<Account> acList=[select id,name from account limit 100];
        system.debug('origin list size:'+aclist.size());
        aclist.remove(0);
        system.debug('list size after 1st remove:'+aclist.size());
        list<account> acLis=[select id,name from account limit 2 offset 100];
        aclist.addall(aclis);
        system.debug('list size after all remove:'+aclist.size());
    }
    
}