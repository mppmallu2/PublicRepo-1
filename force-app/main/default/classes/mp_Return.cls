public class mp_Return {
   public static Integer factorial(Integer n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorial(n - 1);
}
    public static list<Account> method2(set<ID> ids){
        list<Account> acc=[select Id,Name from Account where Id in:ids];
        return acc;        
    }
    public static void method3(){
        list<Account> listAcc=[select Id from Account limit 20];
        set<ID> setId=new set<ID>();
        for(Account ac1:listAcc){
            setID.add(ac1.Id);
        }
        list<Account> acd = method2(setId);
        for(Account acc:acd){
        system.debug(acc);
        }
    }

/*  Usage:
Integer result = factorial(5);
System.out.println(result); // Output: 120  */

}