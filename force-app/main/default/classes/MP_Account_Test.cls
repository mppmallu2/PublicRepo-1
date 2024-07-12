@isTest
Public class MP_Account_Test {
    
    @isTest
    static void met(){
        system.debug('nl');
        account acc=new Account(Name='acc'); 
        insert acc;
        contact cc=new contact(LastName='mpasd',AccountId=acc.ID);
        insert cc;
    }
    @isTest
    static void method1(){
        child_class ah=new child_class();
        ah.callMe();
        ah.show();
        employee hj=new employee();
        hj.show();
    }
    
    
    
}