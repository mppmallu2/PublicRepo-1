public class mp_MixedDMLErrorDemo {
    public static void myMethod() {
        Account a = new Account(Name='ApexHours');
        insert a;
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='apexhours@apexhours.com');
        insert usr;
        
    }
    public static void myMethod_FIX_ERROR() {
        Account a = new Account(Name='ApexHours');
        insert a;
        MP_UtilFutureDemo.insertUser();
    }

}