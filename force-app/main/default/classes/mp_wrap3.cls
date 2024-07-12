public class mp_wrap3 {
    Public Static Void wrapPrint(){
        List<mp_Wrap1> dd= mp_wrap2.method();
        List<Account> account;
        List<Contact> ccount;
        for(mp_wrap1 ref:dd){
            account=ref.acc;
            ccount=ref.cc;
        }
        system.debug(account.size());
        system.debug(ccount.size());
    }
}