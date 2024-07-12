public class mp_wrap2 {
    public static List<mp_wrap1> method(){
        List<Account> acc=[select Name,Id from Account limit 10];
        List<Contact> cc=[select Id,Name from Contact limit 10];
        List<Account> acc1=[select Name,Id from Account where Name like 'rahul%' limit 10];
        List<Contact> cc1=[select Id,Name from Contact where LastName like 'rahul%' limit 10];
        List<mp_wrap1> result=new List<mp_wrap1>();
        result.add(new mp_wrap1(acc,cc));
        result.add(new mp_wrap1(acc1,cc1));
        return result;
    }
    
}