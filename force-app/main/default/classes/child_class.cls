public class child_class extends employee {
    public String name;
    public override void show(){
        name='karan';
        system.debug('this is child class method');
    }  
    public void callMe(){
        system.debug('this is callMe method in child class');
        super.show();
        system.debug(super.name);
        
    }
    @future
    public static void insertrec(){
        insert new account(Name='inserted through future methoud from child_class apex class');
    }
}