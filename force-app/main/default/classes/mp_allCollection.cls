public class mp_allCollection{
    Public Static integer num=100;
    public mp_allCollection(){ //constructor initialise
        String a1='Arjun';
        integer a2=10;  
    }
    // collection map method
    public static void mapMethod(){
        map<integer,string> a=new map<integer,string>();
        a.put(111,'tripple one');
        a.put(222,'tripple two');
        set<integer> q=new set<integer>();
        q=a.keyset();
        //clear(q);
        system.debug(q);
        
        string [] puts=new string[10];
        Integer num = 7; // Replace 7 with your desired value
        Integer hj = (num > 5) ? 12 : 10;
        system.debug(hj);
        
        
        
    }
    
    //map method type 2
    public static void mapMethod2(){
        map<ID,Account> a=new map<ID,Account>([select ID,name from Account]);
        for(ID b:a.keyset()){ //a.keyset you have bunch of keys,let me fetch it one by one usng variable b
            account c=a.get(b);
            system.debug(c);
        }  
    }
    
    // Collection List method
    public static void listMethod(){
        list<account> acc;
        acc=new list<account>();
        account a1=new account(name='arjun',phone='78989324');
        acc.add(a1);
        system.debug(acc);
        Integer queryLimit = Limits.getLimitQueries();
        Integer queryUsage = Limits.getQueries();
        
        System.debug('Current number of SOQL queries used: ' + queryUsage);
        System.debug('Maximum number of SOQL queries allowed: ' + queryLimit);
    }
    
    // Array method
    public static void arrayMethod(){
        String[] v=new string[20];
        integer[] b=new integer[]{10,12,13,13,16};
            Account[] acc=new account[3];
        acc[0]=new Account();
        
        acc[1]=new Account(Name='mppp2');
        acc[2]=new Account(Name='mppp3');
        insert acc;
        for(integer i:b){
            system.debug(i);
        }  
        v[0]='first string okay';
        v[1]='secont string okay';
        v[2]='3rd string okay';
        v[3]='4th string okay';
        v[4]='5th string okay';
        for(string i:v){
            system.debug(i);
        }    
        v=new string[]{'A','B','C','D','E'};
            for(string i:v){
                system.debug(i);    
            }
    }
    
    Public Static void Platform_event(){
        Account_insert__e pevent=new Account_insert__e();
        
        pevent.name__C='Account Insert platform eventggergerggregrrrrrr';
        eventBus.publish(pevent);
    }
    public static String getMessage(Integer num) {
        return (num > 0) ? 'Positive' : 'Non-positive';
    }
    Public Static Void dotNotation(){
        // Assume myContact is a Contact object obtained from somewhere in your code
        Contact myContact = [SELECT Id, FirstName, AccountId FROM Contact  LIMIT 1];
        
        // Traversing downwards to access related opportunities
        List<Opportunity> opps = myContact.Account.Opportunities;
        
    }
    
    Public Static integer accessmodifier(integer a){
        return a+num;
    }
    Public static mp_wrapper  wrapper(){
        mp_wrapper ads=new mp_wrapper();
        ads.a=10;
        ads.b=20;
        return ads;
    }
}
/*
inserting new records
account a=new account(name='luthor',phone='8888888');
insert a;


List<Account> accounts = new List<Account>{
new Account(Name = 'luthorlex', Phone = '888888810'),
new Account(Name = 'luthorking', Phone = '888888811')
};
insert accounts;


list<Account> a=new list<Account>();
account a1=new account(name='one');
a.add(a1);
insert a;







*/