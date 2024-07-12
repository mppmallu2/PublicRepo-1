public class mp_allConcepts {
    public static final double rates=10;
    public static string nh='mp void non static';
    
    //**************************************************************************************************************************
    //***************************************************************************************************************************    
    
    public static void try_catch(){ 		//try and catch block with insert accout record
        system.debug(rates);
        system.debug(nh);
        Account ac = new Account();
        try {
            insert ac;
            System.debug(ac.Id);
        } catch (exception e) {
            System.debug('An exception occurred: ' + e.getMessage());
        }
        
    }
    
    //**********************************************************************************************************
    //***********************************************************************************************************    
    
    @InvocableMethod
    public static void method_database(){	//insert multiple accounts using database
        list<Account> acc=new list<Account>();
        for(integer i=0;i<1000;i++){
            account ac=new account(Name='Account'+i);
            acc.add(ac);
        }
        database.saveResult[] results=database.insert(acc,false);           
        system.debug(results);												
    }		
    
    //*****************************************************************************************************************************
    //**********************************************************************************************************************************    
    public  list<Account> methodShowAccount(){					//Calling this method
        list<Account> acc=[select Id,Name from Account limit 10];		//allConcepts.methodShowAccount();
        return acc;														//for(Account ac1:allConcepts.methodShowAccount()){
    }																	// system.debug(ac1);
    // }
    
    //@description: method to fetch parent acoount through child account and make change in parent sobject
    public static void method_SOQL() {
        Contact cont = [SELECT Name, Account.Name FROM Contact WHERE Id = '0035i00000TNVAUAA5'];
        
        Account parentAccount = cont.Account;
        parentAccount.Description = 'You are Genious Boss';
        
        update parentAccount;
    }
    
    //@Description :method to modify child Sobject Fields through Parent Sobject
    public static void method_SOQLchild(){
        list<Account> acc=[select Name,(select Name from Contacts) from Account limit 10];
        for(Account ac:acc){
            
            for(contact ct:ac.Contacts){
                ct.phone='wineCard';
            }
            update ac.contacts;
        }
        update acc;
    }    
    
    //@ parent and chhild data access and manipulation complex
    public static void method_avi_commerce(){
        contact cct=[select name,Account.Name,Account.active__C,account.Description from Contact where id='0035i00000TNVAUAA5']; //account=0035i00000TNVAUAA5
        contact new1=new contact();
        new1.Lastname='commerce cloud';
        new1.Description=cct.account.Description;
        insert new1;   
    }
    
    //********************************************************************************    
    
    public static void schema_class(){
        map<string,object> resMap=new map<String,object>();
        schema.DescribeSObjectResult result=Account.Sobjecttype.getdescribe();
        system.debug('record type info=:'+ result.recordtypeinfosbydevelopername);
        resMap.put('Label',result.getLabel());
        resMap.put('fields',result.fields);
        resMap.put('RecordType',result.getRecordTypeInfos());
        resMap.put('childrelationships',result.childrelationships);
        for(object adf:resMap.values()){
            system.debug(adf);
        }        
    }
    
    public static void upsertfield(){
        List<account> acc=[select Id,Name from Account limit 10];
        integer i=000;
        for(Account ad:acc){
            
            ad.Name='Upserted field Update'+i;
            i=i+111;
        }
        database.upsertResult[] result=database.upsert(acc,Account.Id,false);
        for(database.upsertResult df:result){
            system.debug(df);
        }       
    }
    
    public static void forloopmax(){
        Set<Integer> num=new set<Integer>();
        for(integer a:num){
            
        }
    }
    
    public static void mapMethod(){
        Map<String, Integer> one = new Map<String, Integer>{'mp1' => 1, 'mp2' => 2,'mp3'=>3,'mp4'=>4,'mp5'=>5,'mp6'=>6,'mp7'=>7};
            system.debug(one.size());
    }
    
    
    /************************************************************************
* 	ternary Operator													*
* 																		*
* **********************************************************************/    
    Public static void TernaryOperator(){
        Integer a = 100;
        String b = (a >= 50) ? 'mp' : 'sp';
        System.debug(b);
    }   
    /*****************************************************************************
* 
* 
* ********************************************************/
    Public static Void queryWay(){
        List<string> conf=new List<string>();
        conf.add('sa@ac.com');
        conf.add('ss@cv.com');
        List<Contact> peopleToSpam = [SELECT Email FROM Contact where Not (email in :conf)];
        
        for(contact cf:peopleToSpam){
            //system.debug(cf.Email);
            conf.add(cf.Email);
        }
        
        boolean say=conf.contains('ss@cv.com');
        system.debug(say);
    }
}    
/*   for Try and catch Exception types
DmlException: This exception is thrown when a Database Manipulation Language (DML) operation,
such as insert, update, or delete, encounters an error.

QueryException: This exception is thrown when there is an issue with a query, 
such as a syntax error or an invalid field reference.

ListException or IndexOutOfBoundsException: These exceptions are thrown when 
there are issues with accessing elements of a list or an array,
such as an index being out of bounds.

NullPointerException: This exception is thrown when there is an attempt to access a variable or 
invoke a method on a null object reference.

Exception: This is the base class for all exceptions in Apex.
It can be used to catch any type of exception that is not explicitly handled by other catch blocks. 
*/